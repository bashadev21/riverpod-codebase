import 'package:dio/dio.dart';
import 'package:flutter_application/services/dio/dio_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => throw UnimplementedError(),
);

class DioApi {
  DioApi._internal();

  static final _singleton = DioApi._internal();

  factory DioApi() => _singleton;

  static Dio createDio() {
    final BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 15000),
      connectTimeout: const Duration(seconds: 15000),
      sendTimeout: const Duration(seconds: 15000),
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
