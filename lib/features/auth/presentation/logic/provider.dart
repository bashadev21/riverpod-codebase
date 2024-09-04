import 'package:flutter_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:flutter_application/features/auth/data/repo/auth_repo_impl.dart';
import 'package:flutter_application/features/auth/domain/repositories/auth_repo.dart';
import 'package:flutter_application/features/auth/domain/usecase/auth_usecase.dart';
import 'package:flutter_application/features/auth/presentation/logic/auth/notifier.dart';
import 'package:flutter_application/features/auth/presentation/logic/auth/state.dart';
import 'package:flutter_application/services/dio.service.dart';
import 'package:flutter_application/services/dio/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _datasource = Provider<AuthDataSource>(
  (ref) => AuthDataSourceImpl(client: DioClient(ref.read(dioProvider))),
);

final _repository = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(_datasource)),
);

final _login = Provider((ref) => AuthUsecase(ref.read(_repository)));

final authNotifier = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(userAuth: ref.read(_login)),
);
