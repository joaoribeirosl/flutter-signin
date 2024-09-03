import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

abstract class IAuthRepository {
  Future<(IAuthError?, User?)> login(User user);
  Future<(IAuthError?, bool?)> signup(User user);
  Future<(IAuthError?, bool?)> resetPassword(String newPassword);
}
