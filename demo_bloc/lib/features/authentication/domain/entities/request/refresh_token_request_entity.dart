class RefreshTokenRequestEntity {
  final String refreshToken;
  final int expiresInMins;

  RefreshTokenRequestEntity(
      {required this.refreshToken, required this.expiresInMins});
}
