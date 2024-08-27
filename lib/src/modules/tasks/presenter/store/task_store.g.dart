// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$totalTasksAtom =
      Atom(name: '_TaskStore.totalTasks', context: context);

  @override
  int get totalTasks {
    _$totalTasksAtom.reportRead();
    return super.totalTasks;
  }

  @override
  set totalTasks(int value) {
    _$totalTasksAtom.reportWrite(value, super.totalTasks, () {
      super.totalTasks = value;
    });
  }

  late final _$doneAtom = Atom(name: '_TaskStore.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void toggleDone() {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.toggleDone');
    try {
      return super.toggleDone();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalTasks: ${totalTasks},
done: ${done}
    ''';
  }
}
