// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthState on _AuthState, Store {
  late final _$errorStateAtom =
      Atom(name: '_AuthState.errorState', context: context);

  @override
  String? get errorState {
    _$errorStateAtom.reportRead();
    return super.errorState;
  }

  @override
  set errorState(String? value) {
    _$errorStateAtom.reportWrite(value, super.errorState, () {
      super.errorState = value;
    });
  }

  late final _$_AuthStateActionController =
      ActionController(name: '_AuthState', context: context);

  @override
  void clearError() {
    final _$actionInfo =
        _$_AuthStateActionController.startAction(name: '_AuthState.clearError');
    try {
      return super.clearError();
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String message) {
    final _$actionInfo =
        _$_AuthStateActionController.startAction(name: '_AuthState.setError');
    try {
      return super.setError(message);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorState: ${errorState}
    ''';
  }
}
