import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/core/enums/auth_status.dart';
import 'package:demo_bloc/core/enums/state_status.dart';
import 'package:demo_bloc/core/extensions/response_extension.dart';
import 'package:demo_bloc/core/resouces/secure_storage.dart';
import 'package:demo_bloc/features/authentication/domain/entities/request/log_in_request_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/user_info_entity.dart';
import 'package:demo_bloc/features/authentication/domain/use_cases/get_current_auth_use_case.dart';
import 'package:demo_bloc/features/authentication/domain/use_cases/log_in_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SecureStorage secureStorage;
  final LogInUseCase logInUseCase;
  final GetCurrentAuthUseCase getCurrentAuthUseCase;
  AuthenticationBloc(
      {required this.logInUseCase,
      required this.secureStorage,
      required this.getCurrentAuthUseCase})
      : super(const AuthenticationState()) {
    on<GetCurrentAuthUserEvent>(_onGetCurrentAuthUser);
    on<LoginAttemptedEvent>(_onAttemptedLogin);
    on<LogOutEvent>(_onLogout);
  }

  FutureOr<void> _onGetCurrentAuthUser(
      GetCurrentAuthUserEvent event, Emitter<AuthenticationState> emit) async {
    final accessToken = await secureStorage.getAccessToken();

    if (accessToken != null) {
      final res = await getCurrentAuthUseCase.call();
      if (res.isSuccessWithData) {
        emit(state.copyWith(
            authStatus: AuthStatus.authorized, stateStatus: StateStatus.done));
      } else {
        //await secureStorage.deleteToken();
        emit(state.copyWith(authStatus: AuthStatus.unauthorized));
      }
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unauthorized));
    }
  }

  FutureOr<void> _onAttemptedLogin(
      LoginAttemptedEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(stateStatus: StateStatus.loading));

    final res = await logInUseCase.call(
        params: const LogInRequestEntity(
            username: 'emilys', password: 'emilyspass', expiresInMins: 5));

    if (res.isSuccessWithData) {
      await secureStorage.writeToken(
          accessToken: res.data!.accessToken,
          refreshToken: res.data!.refreshToken);

      await Future.delayed(const Duration(seconds: 3)); //simulated delay

      emit(state.copyWith(
          stateStatus: StateStatus.done, authStatus: AuthStatus.authorized));
    } else {
      //TODO handle login failed
    }
  }

  FutureOr<void> _onLogout(
      LogOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState(stateStatus: StateStatus.loading));
    await Future.delayed(const Duration(seconds: 1)); //simulated delay
    await secureStorage.deleteToken();
    emit(const AuthenticationState());
  }
}
