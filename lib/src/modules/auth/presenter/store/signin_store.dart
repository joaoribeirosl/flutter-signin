import 'package:flutter_signin/src/modules/auth/domain/usecases/signin_use_case.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/state/signin_state.dart';
import 'package:mobx/mobx.dart';

part 'signin_store.g.dart';

// ignore: library_private_types_in_public_api
class SigninStore = _SigninStore with _$SigninStore;

abstract class _SigninStore with Store {
  final ISigninUseCase _loginUseCase;

  _SigninStore(this._loginUseCase);

  @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  final actualUser = User();

  final state = SigninState();

  @observable
  bool enableSigninButton = false;

  @action
  void toggleEnableSignin(String password) {
    enableSigninButton = password.isNotEmpty;
  }

  Future<bool> login(String username, String password) async {
    actualUser.name = username;
    actualUser.password = password;
    final res = await _loginUseCase.call(actualUser);
    if (res.$2 != null) {
      actualUser.id = res.$2!.id;
      return true;
    }
    return false;
  }
}
