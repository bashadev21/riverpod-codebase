import 'package:flutter_application/core/common/data/datasource/common.datasource.dart';
import 'package:flutter_application/core/common/data/repository/common_repository_impl.dart';
import 'package:flutter_application/core/common/domain/repository/common_repository.dart';
import 'package:flutter_application/core/common/domain/usecase/pick_audio.dart';
import 'package:flutter_application/core/common/domain/usecase/pick_file.dart';
import 'package:flutter_application/core/common/domain/usecase/pick_image.dart';
import 'package:flutter_application/core/common/domain/usecase/pick_multi_image.dart';
import 'package:flutter_application/core/common/logic/file_state/file_state.dart';
import 'package:flutter_application/core/common/logic/file_state/file_state_notifier.dart';
import 'package:flutter_application/services/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _datasource = Provider<CommonDatasource>(
  (ref) => CommonDatasourceImpl(fileService: ref.read(fileService)),
);

final _repository = Provider<CommonRepository>(
  (ref) => CommonRepositoryImpl(datasource: ref.read(_datasource)),
);

final _pickMultiImage = Provider<PickMultiImage>(
  (ref) => PickMultiImage(repository: ref.read(_repository)),
);

final _pickImage = Provider<PickImage>(
  (ref) => PickImage(repository: ref.read(_repository)),
);

final _pickAudio = Provider<PickAudio>(
  (ref) => PickAudio(repository: ref.read(_repository)),
);

final _pickFile = Provider<PickFile>(
  (ref) => PickFile(repository: ref.read(_repository)),
);

final fileNotifier = StateNotifierProvider<FileNotifier, FileState>(
  (ref) => FileNotifier(
    pickMultiImage: ref.read(_pickMultiImage),
    pickImage: ref.read(_pickImage),
    pickAudio: ref.read(_pickAudio),
    pickFile: ref.read(_pickFile),
  ),
);
