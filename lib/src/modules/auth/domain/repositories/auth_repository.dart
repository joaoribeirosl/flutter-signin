import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

abstract class IAuthRepository {
  Future<(IAppError?, User?)> login(User user);
  Future<(IAppError?, bool?)> signup(User user);
}
