import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/reset_password_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signup_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

class AuthRepository implements IAuthRepository {
  final ISigninDatasource _signinDatasource;
  final ISignupDatasource _signupDatasource;
  final IResetPasswordDatasource _resetPasswordDatasource;

  AuthRepository(this._signinDatasource, this._signupDatasource,
      this._resetPasswordDatasource);

  @override
  Future<(IAuthError?, User?)> login(User data) async {
    try {
      final userEncoded = AuthAdapter.protoToData(data);
      final res = await _signinDatasource.login(userEncoded);
      final user = AuthAdapter.protoFromData(res);
      if (user != null) {
        return (null, user);
      } else {
        return (SigninError('user not found'), null);
      }
    } on IAuthError catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(IAuthError?, bool?)> signup(User user) async {
    try {
      final userEncoded = AuthAdapter.protoToData(user);
      final res = await _signupDatasource.signup(userEncoded);
      if (res != null) {
        return (null, true);
      } else {
        return (SignupError('user already exists'), null);
      }
    } on IAuthError catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(IAuthError?, bool?)> resetPassword(String newPassword) async {
    try {
      final res = await _resetPasswordDatasource.resetPassword(newPassword);
      if (res != null) {
        return (null, true);
      } else {
        return (SignupError('user already exists'), null);
      }
    } on IAuthError catch (e) {
      return (e, null);
    }
  }

  // @override
  // Future<(ITaskError?, bool?)> removeTaskById(String idTask) async {
  //   try {
  //     final res = await _removeTaskByIdDatasource.removeTaskById(idTask);
  //     if (res != null) {
  //       return (null, true);
  //     }
  //     return (RemoveTaskError('task not found'), null);
  //   } on ITaskError catch (e) {
  //     return (e, null);
  //   }
  // }
}
