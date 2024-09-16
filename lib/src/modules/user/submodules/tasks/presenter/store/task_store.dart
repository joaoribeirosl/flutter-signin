import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/add_task_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/get_all_tasks_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/remove_task_by_id_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = ITaskStore with _$TaskStore;

abstract class ITaskStore with Store {
  final IAddTaskUseCase _addTaskUseCase;
  final IGetAllTasksUseCase _getAllTasksUseCase;
  final IRemoveTaskByIdUseCase _removeTaskByIdUseCase;

  ITaskStore(this._addTaskUseCase, this._getAllTasksUseCase,
      this._removeTaskByIdUseCase);

  @observable
  bool enableButton = false;

  @action
  void toggleEnableTaskButton(String task) {
    enableButton = task.isNotEmpty;
  }

  @observable
  var taskList = ObservableList<Task>();

  Future<bool> addTask(String task, String idUser) async {
    final currentTask = Task(userId: idUser, task: task);
    if (task.isNotEmpty) {
      final res = await _addTaskUseCase.call(currentTask);
      if (res.$2 != null) {
        enableButton = false;
        return res.$2!;
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

  String shortenedName(String username) {
    int maxLength = 10;
    if (username.length > maxLength) {
      return '${username.substring(0, maxLength)}...';
    }
    return username;
  }
}
