import 'package:flutter_signin/src/modules/user/tasks/domain/usecases/add_task_use_case.dart';
import 'package:flutter_signin/src/modules/user/tasks/domain/usecases/get_all_tasks_use_case.dart';
import 'package:flutter_signin/src/modules/user/tasks/domain/usecases/remove_task_by_id_use_case.dart';
import 'package:flutter_signin/src/modules/user/tasks/infra/proto/tasks.pb.dart';
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

  final actualTask = Task();

  @observable
  List<Task> taskList = ObservableList<Task>();

  Future<bool> addTask(String task, String idUser) async {
    actualTask.task = task;
    actualTask.userId = idUser;
    if (task != '') {
      final res = await _addTaskUseCase.call(actualTask);
      if (res.$2 != null) {
        await getAllTasks(idUser);
        return true;
      }
    }
    return false;
  }

  Future<List<Task>?> getAllTasks(String idUser) async {
    final res = await _getAllTasksUseCase.call(idUser);
    if (res.$2 != null) {
      taskList.clear();
      taskList.addAll(res.$2!);
      return taskList;
    }
    return null;
  }

  Future<bool> removeTaskById(String idTask) async {
    final res = await _removeTaskByIdUseCase.call(idTask);
    if (res.$2 != null) {
      taskList.removeWhere((task) => task.id == idTask);
      return true;
    }
    return false;
  }
}
