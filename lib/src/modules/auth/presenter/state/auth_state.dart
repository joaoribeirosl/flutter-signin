import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

abstract class IAuthState {
  void clearError();
  void setError(String message);
}

// ignore: library_private_types_in_public_api
class AuthState = _AuthState with _$AuthState;

abstract class _AuthState with Store implements IAuthState {
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
