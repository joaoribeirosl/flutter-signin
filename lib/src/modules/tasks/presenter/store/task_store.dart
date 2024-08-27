import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

// ignore: library_private_types_in_public_api
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final String title = '';
  // final AuthStore _authStore;

  // _TaskStore(this._authStore);

  @observable
  int totalTasks = 0;

  // @action
  // void incrementTask() {
  //   totalTasks++;
  // }

  @observable
  bool done = false;

  @action
  void toggleDone() => done = !done;

  // void getUserName() {
  //   // return _authStore.username
  // }
}
