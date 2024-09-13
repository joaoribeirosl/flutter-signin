import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/add_task_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/get_all_tasks_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/remove_task_by_id_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/socket_client_interface.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

// ignore: library_private_types_in_public_api
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final ISocketClient _socketClient;
  final IAddTaskUseCase _addTaskUseCase;
  final IGetAllTasksUseCase _getAllTasksUseCase;
  final IRemoveTaskByIdUseCase _removeTaskByIdUseCase;

  _TaskStore(this._addTaskUseCase, this._getAllTasksUseCase,
      this._removeTaskByIdUseCase, this._socketClient);

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

  String shortenedName(String username) {
    int maxLength = 10;
    if (username.length > maxLength) {
      return '${username.substring(0, maxLength)}...';
    }
    return username;
  }

  void connectSocket() async {
    await _socketClient.connectToServer();
  }

  Future sendTaskIo(String idUser) async {
    return _socketClient.emitData('update_request', idUser);
  }

  Future getTaskCount() async {
    return _socketClient.listenEvent('update_response', test);
  }

  String test() {
    return 'como q escrev';
  }
}
