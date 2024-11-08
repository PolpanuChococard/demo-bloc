import 'package:demo_bloc/core/app_config/interceptor.dart';
import 'package:demo_bloc/core/resouces/services_locator/services_locator.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioConfig {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  );

  DioConfig() {
    dio.interceptors.add(getIt.get<DemoInterceptor>());
  }

  DioConfig.retry() {}
}
