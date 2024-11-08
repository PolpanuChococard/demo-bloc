enum AuthStatus {
  unknown, // Authentication status is not determined yet
  unauthorized, // User is not authenticated or doesn't have permission
  authorized // User is authenticated and authorized
}

extension AuthStatusExtension on AuthStatus {
  bool get isUnAuthorized => this != AuthStatus.authorized;
  bool get isAuthorized => this == AuthStatus.authorized;
}
