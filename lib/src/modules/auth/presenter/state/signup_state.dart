import 'package:mobx/mobx.dart';

part 'signup_state.g.dart';

abstract class ISignupState {
  void clearError();
  void setError(String message);
}

// ignore: library_private_types_in_public_api
class SignupState = _SignupState with _$SignupState;

abstract class _SignupState with Store implements ISignupState {
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
