// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$showPasswordAtom =
      Atom(name: '_AuthStore.showPassword', context: context);

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$enableSigninButtonAtom =
      Atom(name: '_AuthStore.enableSigninButton', context: context);

  @override
  bool get enableSigninButton {
    _$enableSigninButtonAtom.reportRead();
    return super.enableSigninButton;
  }

  @override
  set enableSigninButton(bool value) {
    _$enableSigninButtonAtom.reportWrite(value, super.enableSigninButton, () {
      super.enableSigninButton = value;
    });
  }

  late final _$agreeTermsCheckboxValueAtom =
      Atom(name: '_AuthStore.agreeTermsCheckboxValue', context: context);

  @override
  bool get agreeTermsCheckboxValue {
    _$agreeTermsCheckboxValueAtom.reportRead();
    return super.agreeTermsCheckboxValue;
  }

  @override
  set agreeTermsCheckboxValue(bool value) {
    _$agreeTermsCheckboxValueAtom
        .reportWrite(value, super.agreeTermsCheckboxValue, () {
      super.agreeTermsCheckboxValue = value;
    });
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleEnableSignin(String password) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.toggleEnableSignin');
    try {
      return super.toggleEnableSignin(password);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword},
enableSigninButton: ${enableSigninButton},
agreeTermsCheckboxValue: ${agreeTermsCheckboxValue}
    ''';
  }
}
