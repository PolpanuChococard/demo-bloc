part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends LoginEvent {
  const EmailChangedEvent({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends LoginEvent {
  const PasswordChangedEvent({required this.password});

  final PasswordEntity password;

  @override
  List<Object> get props => [password];
}

class ClearLoginEvent extends LoginEvent {}
