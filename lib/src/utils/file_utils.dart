import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  const FileUtils._();

  static Future<List<List<int>>> splitFileIntoChunks(
    String filePath,
    int chunkSize,
  ) async {
    final file = File(filePath);
    final fileBytes = await file.readAsBytes();
    final chunks = <List<int>>[];

    for (int i = 0; i < fileBytes.length; i += chunkSize) {
      final end = (i + chunkSize < fileBytes.length)
          ? i + chunkSize
          : fileBytes.length;
      chunks.add(fileBytes.sublist(i, end));
    }
    return chunks;
  }

  static Future<File> convertUint8ListToFile(
    Uint8List data, {
    String? fileName,
  }) async {
    final directory = await getTemporaryDirectory();
    final path = directory.path;
    final file = File('$path/${fileName ?? 'temp.bin'}');

    await file.writeAsBytes(data);
    return file;
  }

  static String generateUniqueFileName(String originalName, String dirPath) {
    final parts = originalName.split('.');
    final name = parts.sublist(0, parts.length - 1).join('.');
    final extension = parts.last;

    int counter = 1;
    String newName;
    do {
      newName = '${name}_$counter.$extension';
      counter++;
    } while (File('$dirPath/$newName').existsSync());

    return newName;
  }

  static String getFileNameFromUrl(String url) {
    final uri = Uri.parse(url);
    String fileName = uri.pathSegments.last;

    if (!fileName.contains('.')) {
      fileName += '.tmp';
    }

    return fileName;
  }

  /*static Future<String?> getDownloadPath() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getTemporaryDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
    return directory?.path;
  }*/

  /// Lấy đường dẫn thư mục download
  static Future<Directory> getDownloadDirectory({String? customFolder}) async {
    if (Platform.isAndroid) {
      final dir = await getExternalStorageDirectory();
      if (customFolder != null) {
        return Directory('${dir!.path}/$customFolder');
      }
      return Directory('${dir!.path}/Downloads');
    } else if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      if (customFolder != null) {
        return Directory('${dir.path}/$customFolder');
      }
      return dir;
    } else {
      final dir =
          await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory();
      if (customFolder != null) {
        return Directory('${dir.path}/$customFolder');
      }
      return dir;
    }
  }

  /// Lưu dữ liệu base64 xuống file
  static Future<void> saveBase64ToFile(List<int> bytes, String path) async {
    final file = File(path);
    await file.create(recursive: true);
    await file.writeAsBytes(bytes);
  }

  static bool validateFile(String fileName) {
    final rgx = RegExp(r'[-_. A-Za-z\d]');
    if (!rgx.hasMatch(fileName)) return false;

    final allowedExtensions = [
      "png",
      "gif",
      "jpg",
      "jpeg",
      "webp",
      "mp4",
      "mov",
    ];

    return allowedExtensions.any((ext) => fileName.endsWith(ext));
  }

  static String fileToBase64(File file) {
    final bytes = file.readAsBytesSync();
    return base64Encode(bytes);
  }
}
