import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application/core/config/api.urls.dart';
import 'package:flutter_application/features/auth/data/model/login_req.dart';

import '../model/login_res.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequest req);
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio = Dio();

  @override
  Future<LoginResponse> login(LoginRequest params) async {
    print("data source" + params.toJson().toString());
    print("data source" + API.login.toString());

    try {
      final response = await dio.post(API.login, data: jsonEncode(params));
      print("data" + response.data.toString());
      final data = loginResponseFromJson(jsonEncode(response.data));
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
