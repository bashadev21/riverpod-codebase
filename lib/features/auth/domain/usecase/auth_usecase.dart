import 'package:dartz/dartz.dart';
import 'package:flutter_application/features/auth/data/model/login_req.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/login_res.dart';
import '../repositories/auth_repo.dart';

class AuthUsecase {
  final AuthRepository authRepository;
  AuthUsecase(this.authRepository);

  Future<Either<Failure, LoginResponse>> login(LoginRequest params) async {
    return await authRepository.login(params);
  }
}
