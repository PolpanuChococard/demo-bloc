import 'package:demo_bloc/core/app_config/api_services.dart';
import 'package:demo_bloc/core/resouces/secure_storage.dart';
import 'package:demo_bloc/features/authentication/data/models/request/login_request_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/get_current_auth_response_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/login_response_model.dart';
import 'package:demo_bloc/features/authentication/domain/repositories/auth_repository.dart';
import 'package:demo_bloc/features/authentication/domain/use_cases/get_current_auth_use_case.dart';
import 'package:demo_bloc/features/authentication/domain/use_cases/log_in_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockLogInUseCase extends Mock implements LogInUseCase {}

class MockGetCurrentAuthUseCase extends Mock implements GetCurrentAuthUseCase {}

class MockLogInResponseModel extends Mock implements LoginResponseModel {
  @override
  String get accessToken => 'accessToken';

  @override
  String get refreshToken => 'refreshToken';
}

class MockGetCurrentAuthResponseModel extends Mock
    implements GetCurrentAuthResponseModel {}

class MockLogInRequestModel extends Mock implements LoginRequestModel {}

