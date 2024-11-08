part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState(
      {this.stateStatus = StateStatus.init,
      this.email = '',
      PasswordEntity? password})
      : password = password ?? const PasswordEntity();

  final StateStatus stateStatus;
  final String email;
  final PasswordEntity password;

  LoginState copyWith(
      {StateStatus? stateStatus, String? email, PasswordEntity? password}) {
    return LoginState(
        stateStatus: stateStatus ?? this.stateStatus,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  List<Object> get props => [stateStatus, email, password];
}
