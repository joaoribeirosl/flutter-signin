import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

abstract class ITaskRepository {
  Future<(ITaskError?, bool?)> addTask(Task task);
  Future<(ITaskError?, List<Task>?)> getAllTasks(String idUser);
  Future<(ITaskError?, bool?)> removeTaskById(String idTask);
  Future<(ITaskError?, bool?)> editTaskById(Task actualTask);
}
