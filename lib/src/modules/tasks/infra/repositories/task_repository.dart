import 'dart:typed_data';

import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/domain/repositories/task_respository.dart';
import 'package:flutter_signin/src/modules/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/tasks/infra/datasource/add_task_datasource_interface.dart';
import 'package:flutter_signin/src/modules/tasks/infra/datasource/get_all_tasks_datasource_interface.dart';
import 'package:flutter_signin/src/modules/tasks/infra/datasource/remove_task_by_id_use_case_interface.dart';
import 'package:flutter_signin/src/modules/tasks/infra/proto/tasks.pb.dart';

class TaskRepository implements ITaskRepository {
  final IAddTaskDatasource _addTaskDatasource;
  final IGetAllTasksDatasource _getAllTasksDatasource;
  final IRemoveTaskByIdDatasource _removeTaskByIdDatasource;

  TaskRepository(this._addTaskDatasource, this._getAllTasksDatasource,
      this._removeTaskByIdDatasource);

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
  Future<(ITaskError?, Tasks?)> getAllTasks(String idUser) async {
    // try {
    //   final res = await _getAllTasksDatasource.getAllTasks(idUser);
    //   final tasks = TaskAdapter.protoToData(res);
    //   if (tasks != null) {
    //     return (null, tasks);
    //   }
    // } on ITaskError catch (e) {}
  }

  @override
  Future<(ITaskError?, bool?)> removeTaskById(String id) {
    throw UnimplementedError();
  }
}
