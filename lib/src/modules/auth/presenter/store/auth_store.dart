import 'package:flutter_signin/src/modules/auth/domain/usecases/signin_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final ISigninUseCase _loginUseCase;
  final ISignupUseCase _signupUseCase;

  _AuthStore(this._loginUseCase, this._signupUseCase);

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

  // Future<bool> resetPassword(
  //     String username, String newPassword, String confirmNewPassword) {
  //   // check if user exists in database and if exist return User
  // }
}
