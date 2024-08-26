import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/external/datasource/signin_datasource.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/signup_datasource.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  // late final IAuthUseCases authUseCase;
  final signinDatasource = SigninDatasource();
  final signupDatasource = SignupDatasource();

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

  // bool get isLoginValid =>
  // bool get isSignupValid =>

  // @computed
  // bool get isFormValid => password.length > 6; USE CASES => DOMAIN

  Future<Uint8List?> signup(User user) async {
    return await signupDatasource.signup(user);
  }

  Future<Uint8List?> login(User user) async {
    return await signinDatasource.login(user);
  }
}
