class LogInRequestEntity {
  final String username;
  final String password;
  final int expiresInMins;

  LogInRequestEntity(
      {required this.username,
      required this.password,
      required this.expiresInMins});
}
