import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/domain/repositories/task_respository.dart';

abstract class IRemoveTaskByIdUseCase {
  Future<(ITaskError?, bool?)> call(String idTask);
}

class RemoveTaskByIdUseCase implements IRemoveTaskByIdUseCase {
  final ITaskRepository _repository;

  RemoveTaskByIdUseCase(this._repository);

  @override
  Future<(ITaskError?, bool?)> call(String idTask) async {
    return await _repository.removeTaskById(idTask);
  }
}
