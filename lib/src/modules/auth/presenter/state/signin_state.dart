import 'package:mobx/mobx.dart';

part 'signin_state.g.dart';

abstract class ISigninState {
  void clearError();
  void setError(String message);
}

// ignore: library_private_types_in_public_api
class SigninState = _SigninState with _$SigninState;

abstract class _SigninState with Store implements ISigninState {
  @observable
  String? errorState;

  @action
  @override
  void clearError() {
    errorState = null;
  }

  @action
  @override
  void setError(String message) {
    errorState = message;
  }
}
