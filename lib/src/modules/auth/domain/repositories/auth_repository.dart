import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';

abstract class IAuthRepository {
  Future<(IAppError?,)> login();
}
