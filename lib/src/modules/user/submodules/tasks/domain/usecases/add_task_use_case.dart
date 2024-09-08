import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/repositories/task_respository.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

abstract class IAddTaskUseCase {
  Future<(ITaskError?, bool?)> call(Task task);
}

class AddTaskUseCase implements IAddTaskUseCase {
  final ITaskRepository _repository;

  AddTaskUseCase(this._repository);

  @override
  Future<(ITaskError?, bool?)> call(Task task) async {
    return await _repository.addTask(task);
  }
}
