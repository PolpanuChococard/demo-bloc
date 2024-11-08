import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/core/enums/state_status.dart';
import 'package:demo_bloc/features/shares/domain/entities/response/password_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>(_onChangeEmail);
    on<PasswordChangedEvent>(_onChangePassword);
    on<ClearLoginEvent>(_onClearLogin);
  }

  FutureOr<void> _onChangeEmail(
      EmailChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onChangePassword(
      PasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onClearLogin(
      ClearLoginEvent event, Emitter<LoginState> emit) {
    emit(const LoginState());
  }
}
