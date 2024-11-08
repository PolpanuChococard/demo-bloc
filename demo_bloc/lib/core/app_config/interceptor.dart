import 'package:demo_bloc/core/app_config/dio_config.dart';
import 'package:demo_bloc/core/app_config/end_points.dart';
import 'package:demo_bloc/core/extensions/response_extension.dart';
import 'package:demo_bloc/core/resouces/secure_storage.dart';
import 'package:demo_bloc/features/authentication/data/models/request/refresh_token_request_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/refresh_token_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class DemoInterceptor extends Interceptor {
  final SecureStorage secureStorage;

  DemoInterceptor({required this.secureStorage});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await secureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    print("Request: ${options.method} ${options.uri}");
    handler.next(options); // continue with the request
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print("Response: ${response.statusCode} ${response.data}");
    if (response.statusCode == 401) {
      try {
        final newToken = await _refreshToken();
        if (newToken != null) {
          // Call the `onRetry` function to retry the original request
          final res = await onRetry(response, newToken);
          return handler.resolve(res); // return the new response
        }
        handler.next(response);
      } catch (refreshError) {
        print("Token refresh failed: $refreshError");
        handler.next(response); // continue with the original error
      }
    } else {
      handler.next(response); // continue with the error
    }
  }

  Future<Response> onRetry(Response response, String newToken) async {
    final dio = DioConfig.retry();
    final clonedHeaders = Map.of(response.requestOptions.headers);
    clonedHeaders['Authorization'] = 'Bearer $newToken';

    final clonedOptions = Options(
      method: response.requestOptions.method,
      headers: clonedHeaders,
    );

    print("Retrying request with new token");
    return await dio.dio.request(
      response.requestOptions.path,
      options: clonedOptions,
      data: response.requestOptions.data,
      queryParameters: response.requestOptions.queryParameters,
    );
  }

  Future<String?> _refreshToken() async {
    final retryDio = DioConfig.retry();
    final dio = Dio(retryDio.dio.options);

    final refreshToken = await secureStorage.getRefreshToken();
    if (refreshToken == null) {
      return null;
    }

    final res = await dio.post(EndPoints.refreshToken,
        data: RefreshTokenRequestModel(
            refreshToken: refreshToken, expiresInMins: 1));

    if (res.isSuccessWithData) {
      final data = RefreshTokenResponseModel.fromJson(res.data!);
      await secureStorage.writeToken(
          accessToken: data.accessToken, refreshToken: data.refreshToken);
      return data.accessToken;
    } else {
      return null;
    }
  }
}
