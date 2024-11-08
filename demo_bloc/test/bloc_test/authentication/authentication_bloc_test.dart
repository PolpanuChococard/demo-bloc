import 'package:bloc_test/bloc_test.dart';
import 'package:demo_bloc/core/enums/auth_status.dart';
import 'package:demo_bloc/core/enums/state_status.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/log_in_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/get_current_auth_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/log_in_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/user_info_entity.dart';
import 'package:demo_bloc/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_dependencies/authentication/authentication_mocks.dart';

void main() {
  late MockSecureStorage mockSecureStorage;
  late MockLogInUseCase mockLogInUseCase;
  late MockGetCurrentAuthUseCase mockGetCurrentAuthUseCase;
  late AuthenticationBloc authenticationBloc;

  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockLogInUseCase = MockLogInUseCase();
    mockGetCurrentAuthUseCase = MockGetCurrentAuthUseCase();

    authenticationBloc = AuthenticationBloc(
      logInUseCase: mockLogInUseCase,
      secureStorage: mockSecureStorage,
      getCurrentAuthUseCase: mockGetCurrentAuthUseCase,
    );
  });

  setUpAll(() {
    // Registering the fallback value for LogInRequestEntity
    registerFallbackValue(
        const LogInRequestEntity(username: '', password: '', expiresInMins: 0));

    // registerFallbackValue(
    //     LogInRequestEntity(username: '', password: '', expiresInMins: 0));
  });

  group('AuthenticationBloc', () {
    test('initial state is correct', () {
      expect(authenticationBloc.state, const AuthenticationState());
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [loading, done] when login is successful',
      build: () {
        when(() => mockLogInUseCase.call(params: any(named: 'params')))
            .thenAnswer((_) async => Response<LogInResponseEntity>(
                requestOptions: RequestOptions(),
                data: MockLogInResponseModel(),
                statusCode: 200));

        when(() => mockSecureStorage.writeToken(
              accessToken: any(named: 'accessToken'),
              refreshToken: any(named: 'refreshToken'),
            )).thenAnswer((_) async {});

        return authenticationBloc;
      },
      act: (bloc) => bloc.add(LoginAttemptedEvent()),
      wait: const Duration(seconds: 3),
      expect: () => [
        const AuthenticationState(
            stateStatus: StateStatus.loading, userInfo: UserInfoEntity()),
        const AuthenticationState(
            stateStatus: StateStatus.done,
            authStatus: AuthStatus.authorized,
            userInfo: UserInfoEntity())
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthorized] when there is no access token',
      build: () {
        when(() => mockSecureStorage.getAccessToken())
            .thenAnswer((_) async => null);
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(GetCurrentAuthUserEvent()),
      expect: () => [
        const AuthenticationState(authStatus: AuthStatus.unauthorized),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [authorized] when there is access token',
      build: () {
        when(() => mockGetCurrentAuthUseCase.call()).thenAnswer((_) async =>
            Response<GetCurrentAuthResponseEntity>(
                requestOptions: RequestOptions(),
                data: MockGetCurrentAuthResponseModel(),
                statusCode: 200));

        when(() => mockSecureStorage.getAccessToken())
            .thenAnswer((_) async => 'accessToken');
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(GetCurrentAuthUserEvent()),
      expect: () => [
        const AuthenticationState(
            authStatus: AuthStatus.authorized, stateStatus: StateStatus.done),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthorized] when there is access token but response status not 200',
      build: () {
        when(() => mockGetCurrentAuthUseCase.call()).thenAnswer((_) async =>
            Response<GetCurrentAuthResponseEntity>(
                requestOptions: RequestOptions(),
                data: MockGetCurrentAuthResponseModel(),
                statusCode: 404));

        when(() => mockSecureStorage.getAccessToken())
            .thenAnswer((_) async => 'accessToken');
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(GetCurrentAuthUserEvent()),
      expect: () => [
        const AuthenticationState(authStatus: AuthStatus.unauthorized),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [loading, done] when logout is successful',
      build: () {
        when(() => mockSecureStorage.deleteToken()).thenAnswer((_) async {});
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(LogOutEvent()),
      wait: const Duration(seconds: 1),
      expect: () => [
        const AuthenticationState(stateStatus: StateStatus.loading),
        const AuthenticationState(),
      ],
    );
  });
}
