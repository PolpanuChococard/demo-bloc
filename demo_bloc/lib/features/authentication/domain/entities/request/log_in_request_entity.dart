import 'package:equatable/equatable.dart';

class LogInRequestEntity extends Equatable {
  final String username;
  final String password;
  final int expiresInMins;

  const LogInRequestEntity(
      {required this.username,
      required this.password,
      required this.expiresInMins});

  @override
  // TODO: implement props
  List<Object?> get props => [username, password, expiresInMins];
}
