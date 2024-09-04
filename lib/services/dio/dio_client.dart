import 'package:dio/dio.dart';
import 'package:flutter_application/core/config/api.urls.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: API.baseURL)
abstract class DioClient {
  factory DioClient(Dio dio) = _DioClient;

  @POST(API.login)
  Future<dynamic> loginUser(@Body() dynamic body);
}
