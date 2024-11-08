part of 'authentication_bloc.dart';

final class AuthenticationState extends Equatable {
  const AuthenticationState(
      {this.stateStatus = StateStatus.init,
      this.authStatus = AuthStatus.unknown,
      UserInfoEntity? userInfo})
      : userInfo = userInfo ?? const UserInfoEntity();

  final StateStatus stateStatus;
  final AuthStatus authStatus;
  final UserInfoEntity userInfo;

  AuthenticationState copyWith(
      {StateStatus? stateStatus,
      AuthStatus? authStatus,
      UserInfoEntity? userInfo}) {
    return AuthenticationState(
        stateStatus: stateStatus ?? this.stateStatus,
        authStatus: authStatus ?? this.authStatus,
        userInfo: userInfo ?? this.userInfo);
  }

  @override
  List<Object> get props => [stateStatus, authStatus, userInfo];
}
