import 'package:demo_bloc/core/app_config/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiService {
  final Dio _dio;

  ApiService({required DioConfig dio}) : _dio = dio.dio;

  // GET request
  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? params}) async {
    final response = await _dio.get(endpoint, queryParameters: params);
    return response;
  }

  // POST request
  Future<Response> postRequest(String endpoint,
      {Map<String, dynamic>? data}) async {
    final response = await _dio.post(endpoint, data: data);
    return response;
  }

  // PUT request
  Future<Response> putRequest(String endpoint,
      {Map<String, dynamic>? data}) async {
    final response = await _dio.put(endpoint, data: data);
    return response;
  }

  // DELETE request
  Future<Response> deleteRequest(String endpoint,
      {Map<String, dynamic>? data}) async {
    final response = await _dio.delete(endpoint, data: data);
    return response;
  }
}
