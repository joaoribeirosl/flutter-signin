import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

abstract class ISigninUseCase {
  Future<(IAuthError?, User?)> call(User user);
}

class SigninUseCase implements ISigninUseCase {
  final IAuthRepository _repository;

  SigninUseCase(this._repository);

  @override
  Future<(IAuthError?, User?)> call(User user) async {
    // user.name.isEmpty
    //   (erro, null);
    return await _repository.login(user);
  }
}
