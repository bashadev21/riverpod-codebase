import 'package:flutter_application/features/auth/data/model/login_req.dart';
import 'package:flutter_application/services/dio/dio_client.dart';

import '../model/login_res.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequest req);
}

class AuthDataSourceImpl implements AuthDataSource {
  final DioClient _client;

  AuthDataSourceImpl({required DioClient client}) : _client = client;

  @override
  Future<LoginResponse> login(LoginRequest params) async {
    try {
      final String body = loginRequestToJson(params);
      final data = await _client.loginUser(body);
      final LoginResponse model = LoginResponse.fromJson(data);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
