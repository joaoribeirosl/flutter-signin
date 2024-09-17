import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/repositories/task_respository.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/proto/tasks.pb.dart';

abstract class IEditTaskByIdUseCase {
  Future<(ITaskError?, bool?)> call(Task actualTask);
}

class EditTaskByIdUseCase implements IEditTaskByIdUseCase {
  final ITaskRepository _repository;

  EditTaskByIdUseCase(this._repository);

  @override
  Future<(ITaskError?, bool?)> call(Task actualTask) async {
    return await _repository.editTaskById(actualTask);
  }
}
