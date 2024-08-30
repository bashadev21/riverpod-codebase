import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application/core/errors/failure.dart';

abstract class CommonRepository {
  Future<Either<Failure, FilePickerResult?>> pickMultiImage();
  Future<Either<Failure, FilePickerResult?>> pickImage();
  Future<Either<Failure, FilePickerResult?>> pickAudio();
  Future<Either<Failure, FilePickerResult?>> pickFile();
}
