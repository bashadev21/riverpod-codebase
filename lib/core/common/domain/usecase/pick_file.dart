import 'package:file_picker/file_picker.dart';
import 'package:flutter_application/core/common/domain/repository/common_repository.dart';
import 'package:flutter_application/core/errors/failure.dart';
import 'package:flutter_application/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class PickFile implements UseCase<FilePickerResult?, NoParams> {
  final CommonRepository _repository;

  PickFile({
    required CommonRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, FilePickerResult?>> call(NoParams params) async {
    return await _repository.pickFile();
  }
}
