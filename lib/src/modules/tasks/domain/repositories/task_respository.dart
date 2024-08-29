import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/infra/proto/tasks.pb.dart';

abstract class ITaskRepository {
  Future<(ITaskError?, bool?)> addTask(Task task);
  Future<(ITaskError?, Tasks?)> getAllTasks();
  Future<(ITaskError?, bool?)> removeTaskById(String id);
}
