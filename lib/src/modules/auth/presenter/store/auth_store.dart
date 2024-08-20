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

  Future<Uint8List?> signup() async {
    var newUser = User(id: '1', name: 'jo', password: 'pass'); 
    return await signupDatasource.signup(newUser);
  }

}
