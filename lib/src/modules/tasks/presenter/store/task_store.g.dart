// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$_totalTasksAtom =
      Atom(name: '_TaskStore._totalTasks', context: context);

  @override
  int get _totalTasks {
    _$_totalTasksAtom.reportRead();
    return super._totalTasks;
  }

  @override
  set _totalTasks(int value) {
    _$_totalTasksAtom.reportWrite(value, super._totalTasks, () {
      super._totalTasks = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void incrementTask() {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.incrementTask');
    try {
      return super.incrementTask();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
