import 'package:demo_bloc/core/enums/gender_type.dart';
import 'package:demo_bloc/core/extensions/response_extension.dart';
import 'package:demo_bloc/features/authentication/data/models/request/refresh_token_request_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/get_current_auth_response_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/login_response_model.dart';
import 'package:demo_bloc/features/authentication/data/models/response/refresh_token_response_model.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/log_in_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/get_current_auth_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/log_in_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:demo_bloc/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:demo_bloc/core/app_config/end_points.dart';

import '../mock_dependencies/authentication/authentication_mocks.dart';
import '../mock_dependencies/core/resource_mocks.dart';

void main() {
  late AuthRepositoryImpl authRepository;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    authRepository = AuthRepositoryImpl(apiService: mockApiService);
  });

  group('AuthRepositoryImpl Tests', () {
    test('login success test', () async {
      final mockRequest = const LogInRequestEntity(
          username: 'test', password: 'test123', expiresInMins: 5);
      final mockResponse = Response(
          requestOptions: RequestOptions(),
          data: LoginResponseModel(
                  id: 0,
                  username: "username",
                  email: "email",
                  firstName: 'firstName',
                  lastName: 'lastName',
                  gender: GenderType.male,
                  image: 'image',
                  accessToken: 'accessToken',
                  refreshToken: 'refreshToken')
              .toJson(),
          statusCode: 200);

      when(() => mockApiService.postRequest(EndPoints.login,
          data: any(named: 'data'))).thenAnswer((_) async => mockResponse);

      final result = await authRepository.login(requestBody: mockRequest);

      expect(result.data?.accessToken, equals('accessToken'));
      expect(result.data?.refreshToken, equals('refreshToken'));
      verify(() => mockApiService.postRequest(EndPoints.login,
          data: any(named: 'data'))).called(1);
    });

    test('login failed test', () async {
      final mockRequest = const LogInRequestEntity(
          username: 'test', password: 'test123', expiresInMins: 5);
      final mockResponse = Response(
          requestOptions: RequestOptions(), data: null, statusCode: 404);

      when(() => mockApiService.postRequest(EndPoints.login,
          data: any(named: 'data'))).thenAnswer((_) async => mockResponse);

      final result = await authRepository.login(requestBody: mockRequest);

      expect(result.data?.accessToken, null);
      verify(() => mockApiService.postRequest(EndPoints.login,
          data: any(named: 'data'))).called(1);
    });
  });

  test('getCurrentAuthUser success test', () async {
    final mockResponse = Response(
        requestOptions: RequestOptions(),
        data: GetCurrentAuthResponseModel(
          id: 0,
          username: "username",
          email: "email",
          firstName: 'firstName',
          lastName: 'lastName',
          gender: GenderType.male,
          image: 'image',
        ).toJson(),
        statusCode: 200);

    when(() => mockApiService.getRequest(
          EndPoints.getCurrentAuthUser,
        )).thenAnswer((_) async => mockResponse);

    final result = await authRepository.getCurrentAuthUser();

    expect(result.data?.username, equals('username'));
    expect(result.data?.email, equals('email'));
    verify(() => mockApiService.getRequest(
          EndPoints.getCurrentAuthUser,
        )).called(1);
  });

  test('getCurrentAuthUser failed test', () async {
    final mockResponse =
        Response(requestOptions: RequestOptions(), data: null, statusCode: 404);

    when(() => mockApiService.getRequest(
          EndPoints.getCurrentAuthUser,
        )).thenAnswer((_) async => mockResponse);

    final result = await authRepository.getCurrentAuthUser();

    expect(result.data, null);
    verify(() => mockApiService.getRequest(
          EndPoints.getCurrentAuthUser,
        )).called(1);
  });

  test('refreshToken success test', () async {
    final mockRequest = RefreshTokenRequestModel(
        refreshToken: "refreshToken", expiresInMins: 1);
    final mockResponse = Response(
        requestOptions: RequestOptions(),
        data: RefreshTokenResponseModel(
                accessToken: "accessToken", refreshToken: "refreshToken")
            .toJson(),
        statusCode: 200);

    when(() => mockApiService.postRequest(
          EndPoints.refreshToken,
        )).thenAnswer((_) async => mockResponse);

    final result = await authRepository.refreshToken(requestBody: mockRequest);

    expect(result.data?.refreshToken, equals("refreshToken"));
    verify(() => mockApiService.postRequest(
          EndPoints.refreshToken,
        )).called(1);
  });

  test('refreshToken failed test', () async {
    final mockRequest = RefreshTokenRequestModel(
        refreshToken: "refreshToken", expiresInMins: 1);
    final mockResponse =
        Response(requestOptions: RequestOptions(), data: null, statusCode: 404);

    when(() => mockApiService.postRequest(
          EndPoints.refreshToken,
        )).thenAnswer((_) async => mockResponse);

    final result = await authRepository.refreshToken(requestBody: mockRequest);

    expect(result.data, null);
    verify(() => mockApiService.postRequest(
          EndPoints.refreshToken,
        )).called(1);
  });
}
