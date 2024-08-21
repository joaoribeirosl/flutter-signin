import 'dart:typed_data';

import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signup_datasource.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final SigninDatasource signinDatasource = SigninDatasource();
  final SignupDatasource signupDatasource = SignupDatasource();

  @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() =>
      showPassword = !showPassword; // implement showPassword

  // @computed
  // bool get isFormValid => password.length > 6; USE CASE => DOMAIN

  Future<Uint8List?> signup() async {
    var newUser = User(id: '1', name: 'jo', password: 'pass');
    return await signupDatasource.signup(newUser);
  }

  Future<Uint8List?> login() async {
    var newUser = User(id: '', name: 'jo', password: 'pass');
    return await signinDatasource.login(newUser);
  }
}
