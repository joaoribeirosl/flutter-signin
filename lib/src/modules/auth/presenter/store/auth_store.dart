import 'package:flutter_signin/src/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signin_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/user_exists_use_case.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final ISigninUseCase _loginUseCase;
  final ISignupUseCase _signupUseCase;
  final IResetPasswordUseCase _resetPasswordUseCase;
  final IUserExistsUseCase _userExistsUseCase;

  _AuthStore(this._loginUseCase, this._signupUseCase,
      this._resetPasswordUseCase, this._userExistsUseCase);

  @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  final actualUser = User();

  @observable
  bool enableSigninButton = false;

  @action
  void toggleEnableSignin(String password) {
    enableSigninButton = password.isNotEmpty;
  }

  @observable
  bool agreeTermsCheckboxValue = false;

  Future<bool> login(String userName, String password) async {
    actualUser.name = userName;
    actualUser.password = password;
    final res = await _loginUseCase.call(actualUser);
    if (res.$2 != null) {
      actualUser.id = res.$2!.id;
      return true;
    }
    return false;
  }

  Future<bool> signup(
      String userName, String password, String confirmPassword) async {
    if (password.length >= 6) {
      if (confirmPassword == password) {
        final res =
            await _signupUseCase.call(User(name: userName, password: password));
        if (res.$2 != null) {
          return true;
        }
      }
    }
    return false;
  }

  Future<bool> resetPassword(
      String username, String newPassword, String confirmNewPassword) async {
    final user = await userExists(username);
    if (user == true) {
      if (confirmNewPassword == newPassword) {
        await _resetPasswordUseCase.call(newPassword);
        actualUser.password = newPassword;
        return true;
      }
    }
    return false;
  }

  Future<bool> userExists(String username) async {
    final res = await _userExistsUseCase.call(username);
    if (res.$2 != null) {
      actualUser.id = res.$2!.id;
      actualUser.name = res.$2!.name;
      actualUser.password = res.$2!.password;
      return true;
    }
    return false;
  }
}
