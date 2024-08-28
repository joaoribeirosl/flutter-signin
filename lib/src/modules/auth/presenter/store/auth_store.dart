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

  @observable
  bool enableButton = false;

  @action
  void toggleEnablePassword(String password) {
    enableButton = password.isNotEmpty;
  }

  Future<bool> login(String userName, String password) async {
    final res =
        await _loginUseCase.call(User(password: password, name: userName));
    if (res.$2 != null) {
      return true;
    }
    return false;
  }

  Future<bool> signup(
      String userName, String password, String confirmPassword) async {
    if (confirmPassword == password) {
      final res =
          await _signupUseCase.call(User(password: password, name: userName));
      if (res.$2 != null) {
        return true;
      }
      return false;
    } else {
      return false;
    }
  }
}
