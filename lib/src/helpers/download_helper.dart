import 'dart:typed_data';
import 'package:shared/src/utils/file_utils.dart';
import 'package:shared/src/utils/permission_utils.dart';
import 'package:dio/dio.dart';
import 'package:saver_gallery/saver_gallery.dart';

class DownloadHelper {
  /// Tải file từ URL
  static Future<String?> downloadFile({
    required String url,
    String? fileName,
    String? folderName,
    Function(double progress)? onProgress,
  }) async {
    final hasPermission = await PermissionUtils.requestStoragePermission();
    if (!hasPermission) return null;

    final dir = await FileUtils.getDownloadDirectory(customFolder: folderName);
    if (!await dir.exists()) await dir.create(recursive: true);

    final finalFileName = fileName ?? FileUtils.getFileNameFromUrl(url);
    final filePath = '${dir.path}/$finalFileName';
    final dio = Dio();

    await dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          onProgress?.call(received / total);
        }
      },
    );

    return filePath;
  }

  /// Lưu ảnh hoặc file base64
  static Future<String?> saveBase64File({
    required Uint8List bytes,
    required String fileName,
  }) async {
    final dir = await FileUtils.getDownloadDirectory();
    final path = '${dir.path}/$fileName';
    await FileUtils.saveBase64ToFile(bytes, path);
    return path;
  }

  /// Lưu ảnh vào thư viện
  static Future<bool> saveImageToGallery(
    Uint8List imageBytes, {
    String? name,
  }) async {
    final result = await SaverGallery.saveImage(
      imageBytes,
      fileName: name ?? 'image.png',
      skipIfExists: true,
    );
    return result.isSuccess;
  }
}
