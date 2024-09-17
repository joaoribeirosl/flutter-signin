import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/repositories/task_respository.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/add_task_datasource_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/edit_task_by_id_datasource_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/get_all_tasks_datasource_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/remove_task_by_id_use_case_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

class TaskRepository implements ITaskRepository {
  final IAddTaskDatasource _addTaskDatasource;
  final IGetAllTasksDatasource _getAllTasksDatasource;
  final IRemoveTaskByIdDatasource _removeTaskByIdDatasource;
  final IEditTaskByIdDatasource _editTaskByIdDatasource;

  TaskRepository(this._addTaskDatasource, this._getAllTasksDatasource,
      this._removeTaskByIdDatasource, this._editTaskByIdDatasource);

  @override
  Future<(ITaskError?, bool?)> addTask(Task data) async {
    try {
      final taskEncoded = TaskAdapter.protoToData(data);
      final res = await _addTaskDatasource.addTask(taskEncoded);
      if (res != null) {
        return (null, true);
      } else {
        return (AddTaskError('error to add task'), null);
      }
    } on ITaskError catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(ITaskError?, List<Task>?)> getAllTasks(String idUser) async {
    try {
      final res = await _getAllTasksDatasource.getAllTasks(idUser);
      final tasks = TaskAdapter.protoFromData(res);
      if (tasks != null) {
        return (null, tasks);
      }
      return (GetTasksError('tasks not found'), null);
    } on ITaskError catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(ITaskError?, bool?)> removeTaskById(String idTask) async {
    try {
      final res = await _removeTaskByIdDatasource.removeTaskById(idTask);
      if (res != null) {
        return (null, true);
      }
      return (RemoveTaskError('task not found'), null);
    } on ITaskError catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(ITaskError?, bool?)> editTaskById(Task actualTask) async {
    try {
      final actualTaskEncoded = TaskAdapter.protoToData(actualTask);
      final res = await _editTaskByIdDatasource.editTaskById(actualTaskEncoded);
      if (res != null) {
        return (null, true);
      }
      return (EditTaskError('unable to edit task'), null);
    } on ITaskError catch (e) {
      return (e, null);
    }
  }
}
