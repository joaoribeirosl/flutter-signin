import 'package:flutter_signin/src/modules/auth/domain/usecases/signin_use_case.dart';
import 'package:mobx/mobx.dart';

part 'signin_store.g.dart';

// ignore: library_private_types_in_public_api
class SigninStore = _SigninStore with _$SigninStore;

abstract class _SigninStore with Store {}
