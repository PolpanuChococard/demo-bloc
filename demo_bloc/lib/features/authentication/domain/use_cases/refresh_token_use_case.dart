import 'package:demo_bloc/core/use_cases/use_case_base.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/refresh_token_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/refresh_token_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class RefreshTokenUseCase
    implements
        UseCase<Response<RefreshTokenResponseEntity?>,
            RefreshTokenRequestEntity> {
  RefreshTokenUseCase(this._authRepository);
  final AuthRepository _authRepository;

  @override
  Future<Response<RefreshTokenResponseEntity?>> call(
      {required RefreshTokenRequestEntity params}) {
    return _authRepository.refreshToken(requestBody: params);
  }
}
