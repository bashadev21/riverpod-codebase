import 'package:file_picker/file_picker.dart';
import 'package:flutter_application/services/file.service.dart';

abstract class CommonDatasource {
  Future<FilePickerResult?> pickMultiImage();
  Future<FilePickerResult?> pickImage();
  Future<FilePickerResult?> pickAudio();
  Future<FilePickerResult?> pickFile();
}

class CommonDatasourceImpl implements CommonDatasource {
  final FileService _fileService;

  CommonDatasourceImpl({
    required FileService fileService,
  }) : _fileService = fileService;

  @override
  Future<FilePickerResult?> pickMultiImage() async {
    try {
      var data = await _fileService.pickMultiImage();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickImage() async {
    try {
      var data = await _fileService.pickImage();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickAudio() async {
    try {
      var data = await _fileService.pickAudio();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FilePickerResult?> pickFile() async {
    try {
      var data = await _fileService.pickFile();
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
