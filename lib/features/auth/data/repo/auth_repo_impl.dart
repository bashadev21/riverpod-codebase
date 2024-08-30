import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/features/auth/data/model/login_req.dart';
import 'package:flutter_application/features/auth/data/model/login_res.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server.dart';
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
      return Left(ServerFailure(msg: e.message));
    } on SocketException {
      return const Left(ConnectionFailure(msg: 'No internet connection'));
    } on DioException catch (e) {
      log('error${e.response!.data}');
      return Left(
        ServerFailure(
          msg: e.response?.data['message'].toString() ??
              'Error occured Please try again',
        ),
      );
    }
  }
}
