import 'package:dio/dio.dart';
import 'package:flutter_application/core/errors/failure.dart';

class DioInterceptor extends Interceptor {
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
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        throw TimeOutFailure(
          msg: err.message ?? '',
          requestOptions: err.requestOptions,
        );
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestFailure(
              msg: err.message ?? '',
              requestOptions: err.requestOptions,
            );
          case 401:
            throw UnauthorisedFailure(
              msg: err.message ?? '',
              requestOptions: err.requestOptions,
            );
          case 403:
            throw UnauthorisedFailure(
              msg: err.message ?? '',
              requestOptions: err.requestOptions,
            );
          case 404:
            throw FileNotFoundFailure(
              msg: err.message ?? '',
              requestOptions: err.requestOptions,
            );
          case 500:
            throw InternalServerFailure(
              msg: err.message ?? '',
              requestOptions: err.requestOptions,
            );
          case 502:
            throw BadGateWayFailure(
              msg: err.message ?? '',
              requestOptions: err.requestOptions,
            );
          case 503:
            throw BadGateWayFailure(
              msg: err.message ?? '',
              requestOptions: err.requestOptions,
            );
        }
        break;
      case DioExceptionType.connectionError:
        throw ConnectionFailure(
          msg: err.message ?? '',
          requestOptions: err.requestOptions,
        );
      default:
        throw err;
    }
  }
}
