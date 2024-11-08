import 'package:demo_bloc/features/authentication/domain/entities/request/log_in_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/refresh_token_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/get_current_auth_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/log_in_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/refresh_token_response_entity.dart';
import 'package:demo_bloc/features/shares/domain/repositories/base_repository.dart';
import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<Response<LogInResponseEntity?>> login(
      {required LogInRequestEntity requestBody});

  Future<Response<GetCurrentAuthResponseEntity?>> getCurrentAuthUser();

  Future<Response<RefreshTokenResponseEntity?>> refreshToken(
      {required RefreshTokenRequestEntity requestBody});
}
