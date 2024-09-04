import 'package:flutter_signin/src/modules/user/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/user/tasks/domain/repositories/task_respository.dart';
import 'package:flutter_signin/src/modules/user/tasks/infra/proto/tasks.pb.dart';

abstract class IGetAllTasksUseCase {
  Future<(ITaskError?, List<Task>?)> call(String userId);
}

class GetAllTasksUseCase implements IGetAllTasksUseCase {
  final ITaskRepository _repository;

  GetAllTasksUseCase(this._repository);

  @override
  Future<(ITaskError?, List<Task>?)> call(String userId) async {
    return await _repository.getAllTasks(userId);
  }
}
