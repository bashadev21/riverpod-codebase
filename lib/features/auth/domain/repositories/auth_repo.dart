import 'package:dartz/dartz.dart';
import 'package:flutter_application/features/auth/data/model/login_req.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/login_res.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest params);
}
