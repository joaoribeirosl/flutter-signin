abstract class IAuthError {
  String get message;
  String? get tracking;
}

class AuthError implements IAuthError {
  @override
  final String message;

  @override
  final String? tracking;

  AuthError(this.message, [this.tracking]);
}

class SigninError extends AuthError {
  SigninError(super.message, [super.tracking]);
}

class SignupError extends AuthError {
  SignupError(super.message, [super.tracking]);
}

class DecodeError extends AuthError {
  DecodeError(super.message, [super.tracking]);
}

class ServerError extends AuthError {
  ServerError(super.message, [super.tracking]);
}
