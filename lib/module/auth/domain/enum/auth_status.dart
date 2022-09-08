enum AuthenticationStatus {
  authentication,
  unauthentication,
}

extension AuthenticationStatusX on AuthenticationStatus {
  bool get isAuthentication => this == AuthenticationStatus.authentication;
  bool get isUnAuthentication => this == AuthenticationStatus.unauthentication;
}
