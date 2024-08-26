import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

class AuthRepository implements IAuthRepository {
  final ISigninDatasource _signinDatasource;

  AuthRepository(this._signinDatasource);

  @override
  Future<(IAppError?, User?)> login(User data) async {
    try {
      final userEncoded = AuthAdapter.protoToData(data);
      final res = await _signinDatasource.login(userEncoded);
      final user = AuthAdapter.dataFromProto(res);
      if (user != null) {
        return (null, user);
      } else {
        return (SigninError('user not found'), null);
      }
    } on IAppError catch (e) {
      return (e, null);
    }
  }
}