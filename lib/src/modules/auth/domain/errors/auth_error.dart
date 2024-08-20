abstract class IAppError {
  String get message;
  String? get tracking;
}

class AppError implements IAppError {
  @override
  final String message;

  @override
  final String? tracking;

  AppError(this.message, [this.tracking]);
}

class SigninError extends AppError {
  SigninError(super.message, [super.tracking]);
}

class SignupError extends AppError {
  SignupError(super.message, [super.tracking]);
}

class DecodeError extends AppError {
  DecodeError(super.message, [super.tracking]);
}