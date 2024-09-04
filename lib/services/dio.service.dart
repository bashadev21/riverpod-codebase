import 'package:dio/dio.dart';
import 'package:flutter_application/core/errors/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => throw UnimplementedError(),
);

class DioService {
  DioService._internal();

  static final _singleton = DioService._internal();

  factory DioService() => _singleton;

  static Dio getInstance() {
    final BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 15000),
      connectTimeout: const Duration(seconds: 15000),
      sendTimeout: const Duration(seconds: 15000),
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(_DioInterceptor());
    return dio;
  }
}

class _DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Do something before request is sent.
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with the response data.
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Do something with the response error.
    _handleError(err);
    super.onError(err, handler);
  }

  _handleError(DioException err) {
    final type = err.type;

    if ([
      DioExceptionType.receiveTimeout,
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout
    ].contains(type)) {
      throw TimeOutFailure(msg: err.message, options: err.requestOptions);
    }

    if (type == DioExceptionType.connectionError) {
      throw ConnectionFailure(msg: err.message, options: err.requestOptions);
    }

    if (type == DioExceptionType.badResponse) {
      final statusCode = err.response?.statusCode;

      if (statusCode == 400) {
        throw BadRequestFailure(msg: err.message, options: err.requestOptions);
      }

      if ([401, 403].contains(statusCode)) {
        throw UnauthorisedFailure(
            msg: err.message, options: err.requestOptions);
      }

      if (statusCode == 404) {
        throw FileNotFoundFailure(
            msg: err.message, options: err.requestOptions);
      }
      if (statusCode == 500) {
        throw InternalFailure(msg: err.message, options: err.requestOptions);
      }

      if ([502, 503].contains(statusCode)) {
        throw BadGateWayFailure(msg: err.message, options: err.requestOptions);
      }

      if (statusCode == 503) {
        throw BadGateWayFailure(msg: err.message, options: err.requestOptions);
      }
    }

    throw ServerFailure(msg: err.message, options: err.requestOptions);
  }
}
