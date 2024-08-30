import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class FileParams extends Equatable {
  final String path;
  final String? fileName;
  final PlatformFile? file;

  const FileParams({required this.path, this.fileName, this.file});

  @override
  List<Object?> get props => [path, fileName, file];
}
