import 'package:dio/dio.dart';
import 'package:flutter_application/services/cache.service.dart';

abstract class ApiService {
  Future get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });
  Future post({
    required String url,
    required String body,
    Map<String, String>? headers,
  });
}

class ApiServiceImpl implements ApiService {
  final CacheService _cacheService;
  final Dio _dio;

  ApiServiceImpl({
    required CacheService cacheService,
    required Dio dio,
  })  : _cacheService = cacheService,
        _dio = dio;

  final Map<String, String> _headers = {};

  @override
  Future get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    // If accessToken is saved in cache
    final accessToken = _cacheService.getCache('TOKEN');
    if (accessToken != null) _headers[''] = accessToken;
    if ((_headers).isNotEmpty) _dio.options.headers.addAll(_headers);
    if ((headers ?? {}).isNotEmpty) _dio.options.headers.addAll(headers!);
    final response = await _dio.get(url, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future post({
    required String url,
    required String body,
    Map<String, String>? headers,
  }) async {
    // If accessToken is saved in cache
    final accessToken = _cacheService.getCache('TOKEN');
    if (accessToken != null) _headers[''] = accessToken;
    if ((_headers).isNotEmpty) _dio.options.headers.addAll(_headers);
    if ((headers ?? {}).isNotEmpty) _dio.options.headers.addAll(headers!);
    final response = await _dio.post(url, data: body);
    return response.data;
  }
}
