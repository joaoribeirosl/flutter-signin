import 'package:flutter_signin/src/modules/tasks/domain/usecases/add_task_use_case.dart';
import 'package:flutter_signin/src/modules/tasks/domain/usecases/get_all_tasks_use_case.dart';
import 'package:flutter_signin/src/modules/tasks/domain/usecases/remove_task_by_id_use_case.dart';
import 'package:flutter_signin/src/modules/tasks/infra/proto/tasks.pb.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

// ignore: library_private_types_in_public_api
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final IAddTaskUseCase _addTaskUseCase;
  final IGetAllTasksUseCase _getAllTasksUseCase;
  final IRemoveTaskByIdUseCase _removeTaskByIdUseCase;

  _TaskStore(this._addTaskUseCase, this._getAllTasksUseCase,
      this._removeTaskByIdUseCase);

  // @observable
  // int _totalTasks = 0;

  // @action
  // void incrementTask() {
  //   _totalTasks++;
  // }

  @observable
  bool enableButton = false;

  @action
  void toggleEnableTaskButton(String task) {
    enableButton = task.isNotEmpty;
  }

  // @observable
  // bool done = false;

  // @action
  // void toggleDone() => done = !done;

  final actualTask = Task();

  @observable
  List<Task> taskList = ObservableList<Task>();

  Future<bool> addTask(String task, String userId) async {
    actualTask.task = task;
    actualTask.userId = userId;
    if (task != '') {
      final res = await _addTaskUseCase.call(actualTask);
      if (res.$2 != null) {
        taskList.insert(0, actualTask);
        return true;
      }
    }
    return false;
  }

  Future<List<Task>?> getAllTasks(String userId) async {
    final res = await _getAllTasksUseCase.call(userId);
    if (res.$2 != null) {
      for (var item in res.$2!) {
        taskList.insert(0, item);
      }
      return taskList;
    }
    return null;
  }

  Future<bool> removeTaskById(String taskId) async {
    final res = await _removeTaskByIdUseCase.call(taskId);
    if (res.$2 != null) {
      // remove task from list
      return true;
    }
    return false;
  }
}
