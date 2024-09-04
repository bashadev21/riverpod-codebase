import 'package:flutter_application/core/config/api.urls.dart';
import 'package:flutter_application/modules/tango_trax/features/auth/data/model/login_req.dart';
import 'package:flutter_application/services/api.service.dart';

import '../model/login_res.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequest req);
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiService _apiService;

  AuthDataSourceImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<LoginResponse> login(LoginRequest params) async {
    try {
      const String url = API.login;
      final String body = loginRequestToJson(params);
      final data = await _apiService.post(url: url, body: body);
      final LoginResponse model = LoginResponse.fromJson(data);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
