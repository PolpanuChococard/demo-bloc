import 'package:demo_bloc/core/use_cases/use_case_base.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/log_in_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/log_in_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogInUseCase
    implements UseCase<Response<LogInResponseEntity?>, LogInRequestEntity> {
  LogInUseCase(this._authRepository);
  final AuthRepository _authRepository;

  @override
  Future<Response<LogInResponseEntity?>> call({
    required LogInRequestEntity params,
  }) {
    return _authRepository.login(requestBody: params);
  }
}
