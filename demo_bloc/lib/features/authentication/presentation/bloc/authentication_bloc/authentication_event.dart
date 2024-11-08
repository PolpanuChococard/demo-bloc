part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentAuthUserEvent extends AuthenticationEvent {}

class LoginAttemptedEvent extends AuthenticationEvent {}

class LogOutEvent extends AuthenticationEvent {}
