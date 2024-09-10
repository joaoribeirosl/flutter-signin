import 'package:flutter_signin/src/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/state/signup_state.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

// ignore: library_private_types_in_public_api
class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  final ISignupUseCase _signupUseCase;

  _SignupStore(this._signupUseCase);

  SignupState state = SignupState();

  @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  @observable
  bool agreeTermsCheckboxValue = false;

  Future<bool> signup(
      String username, String password, String confirmPassword) async {
    if (password.length >= 6) {
      if (confirmPassword == password) {
        final res =
            await _signupUseCase.call(User(name: username, password: password));
        if (res.$2 != null) {
          return true;
        }
      }
    }
    return false;
  }
}
