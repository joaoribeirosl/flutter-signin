import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  @observable
  String username = '';

  @action
  void setUsername(String value) => username = value;

  @observable
  String password = '';

  @observable
  bool showPassword = false;

  @action
  void setPassword(String value) => password = value;

  @action
  void toggleShowPassword() => showPassword = !showPassword; // implement showPassword

  @computed
  bool get isFormValid => password.length > 6;

}
