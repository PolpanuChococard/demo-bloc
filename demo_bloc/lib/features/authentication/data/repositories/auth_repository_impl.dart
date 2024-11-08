import 'package:demo_bloc/core/app_config/end_points.dart';
import 'package:demo_bloc/features/authentication/data/models/request/login_request_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/get_current_auth_response_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/login_response_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/refresh_token_response_model.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/log_in_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/refresh_token_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/get_current_auth_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/log_in_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/refresh_token_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/repositories/auth_repository.dart';
import 'package:demo_bloc/features/shares/domain/repositories/base_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl({required super.apiService});

  @override
  Future<Response<LogInResponseEntity?>> login(
      {required LogInRequestEntity requestBody}) async {
    final body = LoginRequestModel.fromEntity(requestBody);
    final response =
        await apiService.postRequest(EndPoints.login, data: body.toJson());

    try {
      final data = LoginResponseModel.fromJson(response.data);
      return createResponse<LogInResponseEntity?>(response, data);
    } catch (e) {
      print(e);
      return createResponse<LogInResponseEntity?>(response, null);
    }
  }

  @override
  Future<Response<GetCurrentAuthResponseEntity?>> getCurrentAuthUser() async {
    final response = await apiService.getRequest(EndPoints.getCurrentAuthUser);
    try {
      final data = GetCurrentAuthResponseModel.fromJson(response.data);
      return createResponse<GetCurrentAuthResponseEntity?>(response, data);
    } catch (e) {
      print(e);
      return createResponse<GetCurrentAuthResponseEntity?>(response, null);
    }
  }

  @override
  Future<Response<RefreshTokenResponseEntity?>> refreshToken(
      {required RefreshTokenRequestEntity requestBody}) async {
    final response = await apiService.postRequest(EndPoints.refreshToken);

    try {
      final data = RefreshTokenResponseModel.fromJson(response.data);
      return createResponse<RefreshTokenResponseEntity>(response, data);
    } catch (e) {
      return createResponse<RefreshTokenResponseEntity?>(response, null);
    }
  }
}
