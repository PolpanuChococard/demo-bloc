import 'package:demo_bloc/core/use_cases/use_case_base.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/get_current_auth_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentAuthUseCase
    implements UseCase<Response<GetCurrentAuthResponseEntity?>, void> {
  GetCurrentAuthUseCase(this._authRepository);
  final AuthRepository _authRepository;

  @override
  Future<Response<GetCurrentAuthResponseEntity?>> call({
    void params,
  }) {
    return _authRepository.getCurrentAuthUser();
  }
}
