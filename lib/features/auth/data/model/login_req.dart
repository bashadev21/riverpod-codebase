// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String username;
  String password;
  int expiresInMins;

  LoginRequest({
    required this.username,
    required this.password,
    required this.expiresInMins,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        username: json['username'],
        password: json['password'],
        expiresInMins: json['expiresInMins'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'expiresInMins': expiresInMins,
      };
}
