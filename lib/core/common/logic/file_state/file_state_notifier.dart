import 'package:flutter_application/core/common/domain/usecase/pick_audio.dart';
import 'package:flutter_application/core/common/domain/usecase/pick_file.dart';
import 'package:flutter_application/core/common/domain/usecase/pick_image.dart';
import 'package:flutter_application/core/common/domain/usecase/pick_multi_image.dart';
import 'package:flutter_application/core/common/logic/file_state/file_state.dart';
import 'package:flutter_application/core/usecases/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileNotifier extends StateNotifier<FileState> {
  final PickMultiImage _pickMultiImage;
  final PickImage _pickImage;
  final PickAudio _pickAudio;
  final PickFile _pickFile;

  FileNotifier({
    required PickMultiImage pickMultiImage,
    required PickImage pickImage,
    required PickAudio pickAudio,
    required PickFile pickFile,
  })  : _pickMultiImage = pickMultiImage,
        _pickImage = pickImage,
        _pickAudio = pickAudio,
        _pickFile = pickFile,
        super(const FileState.initial());

  Future<void> pickMultiImages() async {
    state = const FileState.loading();

    var data = await _pickMultiImage.call(NoParams());

    data.fold(
      (l) => state = FileState.error(e: l.msg),
      (r) => state = FileState.multiImage(data: r),
    );
  }

  Future<void> pickImage() async {
    state = const FileState.loading();

    var data = await _pickImage.call(NoParams());

    data.fold(
      (l) => state = FileState.error(e: l.msg),
      (r) => state = FileState.singleImage(data: r),
    );
  }

  Future<void> pickAudio() async {
    state = const FileState.loading();

    var data = await _pickAudio.call(NoParams());

    data.fold(
      (l) => state = FileState.error(e: l.msg),
      (r) => state = FileState.audio(data: r),
    );
  }

  Future<void> pickFile() async {
    state = const FileState.loading();

    var data = await _pickFile.call(NoParams());

    data.fold(
      (l) => state = FileState.error(e: l.msg),
      (r) => state = FileState.file(data: r),
    );
  }
}
