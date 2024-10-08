import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

abstract class ISignupUseCase {
  Future<(IAuthError?, bool?)> call(User user);
}

class SignupUseCase implements ISignupUseCase {
  final IAuthRepository _repository;

  SignupUseCase(this._repository);

  @override
  Future<(IAuthError?, bool?)> call(User user) async {
    return await _repository.signup(user);
  }
}
