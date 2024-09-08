import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

abstract class IUserExistsUseCase {
  Future<(IAuthError?, User?)> call(String username);
}

class UserExistsUseCase implements IUserExistsUseCase {
  final IAuthRepository _repository;

  UserExistsUseCase(this._repository);

  @override
  Future<(IAuthError?, User?)> call(String username) async {
    return await _repository.userExists(username);
  }
}
