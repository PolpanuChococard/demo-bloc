import 'package:demo_bloc/core/app_config/api_services.dart';
import 'package:dio/dio.dart';

class BaseRepository {
  BaseRepository({required this.apiService});
  final ApiService apiService;

  Response<T?> createResponse<T>(Response<dynamic> response, T? data) {
    return Response<T>(
        data: data,
        requestOptions: response.requestOptions,
        headers: response.headers,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
        isRedirect: response.isRedirect,
        redirects: response.redirects);
  }
}
