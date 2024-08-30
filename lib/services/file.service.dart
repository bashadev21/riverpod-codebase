import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application/core/common/params/file_params.dart';

abstract class FileService {
  Future<Directory?> getTempDirectory();
  Future<Directory?> getDirectory();
  Future<void> createPath(FileParams params);
  Future<File> saveFile(FileParams params);
  Future<void> deleteFile(FileParams params);
  Future<FilePickerResult?> pickMultiImage();
  Future<FilePickerResult?> pickImage();
  Future<FilePickerResult?> pickAudio();
  Future<FilePickerResult?> pickFile();
}

class FileServiceImpl implements FileService {
  final FilePicker _filePicker = FilePicker.platform;

  @override
  Future<Directory?> getTempDirectory() async {
    try {
      return await getTemporaryDirectory();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Directory?> getDirectory() async {
    try {
      if (Platform.isAndroid) {
        return await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        return await getApplicationSupportDirectory();
      }
      throw 'Invalid Platform';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createPath(FileParams params) async {
    try {
      var dir = Directory(params.path);
      var isExist = await dir.exists();
      if (isExist) return;
      await dir.create(recursive: true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<File> saveFile(FileParams params) async {
    try {
      var bytes = await File(params.file?.path ?? '').readAsBytes();
      // if (bytes == null) throw 'Invalid file';
      var dir = Directory(params.path);
      var isExist = await dir.exists();
      if (!isExist) await dir.create(recursive: true);
      String newPath = '${params.path}/${params.fileName}';
      var file = await File(newPath).writeAsBytes(bytes);
      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteFile(FileParams params) async {
    try {
      await File(params.path).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickMultiImage() async {
    try {
      var files = await _filePicker.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
      return files;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickImage() async {
    try {
      var file = await _filePicker.pickFiles(type: FileType.image);
      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickAudio() async {
    try {
      return await _filePicker.pickFiles(
        type: FileType.audio,
        allowMultiple: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickFile() async {
    try {
      var file = await _filePicker.pickFiles(type: FileType.any);
      return file;
    } catch (e) {
      rethrow;
    }
  }
}
