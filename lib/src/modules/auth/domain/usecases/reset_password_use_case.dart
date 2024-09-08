import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';

abstract class IResetPasswordUseCase {
  Future<(IAuthError?, bool?)> call(String newPassword);
}

class ResetPasswordUseCase implements IResetPasswordUseCase {
  final IAuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<(IAuthError?, bool?)> call(String newPassword) async {
    return await _repository.resetPassword(newPassword);
  }
}
