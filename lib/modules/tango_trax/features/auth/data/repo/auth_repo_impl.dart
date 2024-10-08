import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/modules/tango_trax/features/auth/data/model/login_req.dart';
import 'package:flutter_application/modules/tango_trax/features/auth/data/model/login_res.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/errors/server.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasource/auth_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.dataSource);
  final AuthDataSource dataSource;

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest params) async {
    try {
      final result = await dataSource.login(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(DatabaseFailure(msg: e.message));
    } on SocketException {
      return const Left(ConnectionFailure(msg: 'No internet connection'));
    } on DioException catch (e) {
      return Left(e.error as Failure);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(InternalFailure(msg: '$e'));
    }
  }
}
