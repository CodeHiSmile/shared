import 'dart:io';
import 'dart:typed_data';
import 'package:shared/src/constants/base_constants.dart';
import 'package:shared/src/utils/location_utils.dart';
import 'package:shared/src/utils/show_loading_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

class MediaUtils {
  //Làm phần này cần chú ý lỗi context, khi truyền vào bottomsheet rồi nếu close bottomsheet đi thì sẽ không còn context nữa
  //Nếu truyền context vào thì phải truyền context của màn hình chứ không dùng context của bottom sheet

  static Future onTakeImage({
    required BuildContext context,
    ImageSource source = ImageSource.camera,
    required Function(File file) onSubmitImage,
    String? address,
    String? employeeCode,
    bool hasResize = false,
    bool? isCheckPermission,
    bool? isGetAddress,
    Function? onShowAlertSetting,
  }) async {
    bool isCanTake = true;
    String? addressShow = address;
    String? employeeCodeShow = employeeCode;

    try {
      if (isCheckPermission ?? true) {
        PermissionStatus permissionCamera = await Permission.camera.status;
        if (permissionCamera != PermissionStatus.denied) {
          if (permissionCamera == PermissionStatus.permanentlyDenied) {
            isCanTake = false;
            if (!context.mounted) return;
            onShowAlertSetting?.call();
            // AppDialogHelper.showAlertSetting(
            //   context,
            //   message:
            //       "Mở quyền cho phép truy cập camera để sử dụng được tính năng này",
            // );
          } else {
            isCanTake = true;
          }
        } else {
          final result = await Permission.camera.request();

          if (result != PermissionStatus.denied) {
            if (result == PermissionStatus.permanentlyDenied) {
              isCanTake = false;
              if (!context.mounted) return;
              onShowAlertSetting?.call();
              // AppDialogHelper.showAlertSetting(
              //   context,
              //   message:
              //       "Mở quyền cho phép truy cập camera để sử dụng được tính năng này",
              // );
            } else {
              isCanTake = true;
            }
          }
        }
      }

      if (isGetAddress ?? false) {
        if (!context.mounted) return;
        ShowLoadingUtils.instance.turnOn(context);
        final location = await LocationUtils.getAddressFromLatLng();
        if (location.isNotEmpty) {
          addressShow = location;
        }
        ShowLoadingUtils.instance.turnOff();
      }

      if (isCanTake) {
        final ImagePicker picker = ImagePicker();

        final imageFile = await picker.pickImage(
          source: source,
          preferredCameraDevice: CameraDevice.rear,
        );

        if (imageFile != null) {
          if ((addressShow ?? '').isNotEmpty) {
            final image = await canvasInfo(
              address: addressShow!,
              imageUrl: imageFile.path,
              fileName: imageFile.name,
              employeeCode: employeeCodeShow,
            );

            if (image != null) {
              onSubmitImage.call(image);
            }
          } else {
            if (hasResize) {
              final data = await processImage(imageFile.path);
              onSubmitImage.call(data);
            } else {
              final fileImage = File(imageFile.path);
              onSubmitImage.call(fileImage);
            }
          }
        }
      }
    } catch (e) {
      debugPrint("Lỗi: $e");
    }
  }

  static Future<File> processImage(String path) async {
    File temp = File(path);
    if ((temp.lengthSync() / 1024 / 1024) > BaseConstants.imageSize) {
      final imageResize = await resizeImage(
        temp,
        imageSize: BaseConstants.imageSize,
      );

      if (imageResize != null) {
        temp = imageResize;
        return temp;
      }
      return File(path);
    } else {
      return temp;
    }
  }

  ///reSize Image
  static Future<File?> resizeImage(
    File file, {
    required int imageSize,
    Function(File)? onSubmitImage,
    Function? onErrorImage,
  }) async {
    final dir = await getTemporaryDirectory();
    final targetPath = "${dir.absolute.path}/${"temp.jpg"}";

    File? result;
    for (int i = 95; i > 5; i -= 5) {
      final data = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: i,
      );
      result = File(data!.path);

      final bytes = (result.lengthSync());
      final mb = (bytes / 1024.0) / 1024.0;
      if (mb <= imageSize) {
        onSubmitImage?.call(result);
        return result;
      }
    }
    onErrorImage?.call();
    return result;
  }

  static Future<File?> canvasInfo({
    required String imageUrl,
    required String fileName,
    required String address,
    String? employeeCode,
  }) async {
    try {
      final result = await _readFileByte(imageUrl).then((bytesData) async {
        ui.Image image = await decodeImageFromList(bytesData);
        var pictureRecorder = ui.PictureRecorder();
        var canvas = Canvas(pictureRecorder);
        var paint = Paint()..isAntiAlias = true;

        // Sử dụng kích thước thật của ảnh
        var width = image.width;
        var height = image.height;
        var format = ui.ImageByteFormat.png;
        var src = Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble());
        var dst = Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble());

        canvas.drawImageRect(image, src, dst, paint);
        final currentTime = DateTime.now();
        TextSpan span = TextSpan(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 80.0, // giảm font size để phù hợp ảnh lớn
            fontFamily: 'Roboto',
          ),
          text:
              "$address"
              "${employeeCode != null ? "\n$employeeCode" : ""}"
              "\n${currentTime.day}/${currentTime.month}/${currentTime.year} at ${currentTime.hour}:${currentTime.minute}:${currentTime.second}",
        );

        TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          maxLines: null,
        );

        double textMaxWidth = width - 40;
        tp.layout(maxWidth: textMaxWidth);
        tp.paint(canvas, const Offset(20, 20));

        var pic = pictureRecorder.endRecording();
        ui.Image img = await pic.toImage(width, height);
        var byteData = await img.toByteData(format: format);
        var buffer = byteData!.buffer.asUint8List();

        final dir = await getTemporaryDirectory();
        final targetPath = "${dir.absolute.path}/$fileName";

        File file = await File(targetPath).create();
        file.writeAsBytesSync(buffer);

        return file;
      });

      return result;
    } catch (e) {
      debugPrint("Lỗi: $e");
    }
    return null;
  }

  static Future<Uint8List> _readFileByte(String filePath) async {
    Uri myUri = Uri.parse(filePath);
    File file = File.fromUri(myUri);
    late Uint8List bytes;
    await file
        .readAsBytes()
        .then((value) {
          bytes = Uint8List.fromList(value);
          debugPrint('SUCCESS: reading of bytes is completed');
        })
        .catchError((onError) {
          debugPrint(
            'ERROR: Exception Error while reading audio from path:$onError',
          );
        });

    return bytes;
  }

  static Future onChooseImage({
    ImageSource source = ImageSource.gallery,
    required Function(File file) onSubmitImage,
    bool hasResize = false,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();

      final imageFile = await picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (imageFile != null) {
        if (hasResize) {
          final data = await processImage(imageFile.path);
          onSubmitImage.call(data);
        } else {
          final fileImage = File(imageFile.path);
          onSubmitImage.call(fileImage);
        }
      }
    } catch (e) {
      debugPrint("Lỗi: $e");
    }
  }

  static Future onChooseMultiImage({
    required Function(List<File> file) onSubmitMultiImage,
    required BuildContext context,
    bool hasResize = false,
    int maxImage = 3,
    Function? onShowError,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();

      final imageFile = await picker.pickMultiImage(limit: maxImage);

      List<File> listFileImage = [];
      if (imageFile.isNotEmpty) {
        if (imageFile.length > maxImage) {
          if (!context.mounted) return;

          onShowError?.call();
          // AppDialogHelper.showDialogCenter(
          //   context,
          //   message: "Không chọn quá $maxImage ảnh",
          //   status: DialogStatus.error,
          // );

          return;
        } else if (hasResize) {
          for (var file in imageFile) {
            final data = await processImage(file.path);
            listFileImage.add(data);
          }
          onSubmitMultiImage.call(listFileImage);
        } else {
          for (var file in imageFile) {
            final fileImage = File(file.path);
            listFileImage.add(fileImage);
          }
        }
        onSubmitMultiImage.call(listFileImage);
      }
    } catch (e) {
      debugPrint("Lỗi: $e");
    }
  }

  static Future onChooseVideo({
    ImageSource source = ImageSource.gallery,
    required Function(File file) onSubmitVideo,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();

      final videoFile = await picker.pickVideo(
        source: source,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (videoFile != null) {
        final fileVideo = File(videoFile.path);
        onSubmitVideo.call(fileVideo);
      }
    } catch (e) {
      debugPrint("Lỗi: $e");
    }
  }

  static Future onChooseFile(
    BuildContext context, {
    List<String>? extensions,
    required Function(File file) onSubmitFile,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions ?? BaseConstants.listExtensionFile,
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        onSubmitFile.call(file);

        if (!context.mounted) return;
        Navigator.of(context).pop();
      }
    } catch (e) {
      debugPrint("Lỗi: $e");
    }
  }
}
