import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/domain/repositories/task_respository.dart';
import 'package:flutter_signin/src/modules/tasks/infra/proto/tasks.pb.dart';

abstract class IGetAllTasksUseCase {
  Future<(ITaskError?, Tasks?)> call(String userId);
}

class GetAllTasksUseCase implements IGetAllTasksUseCase {
  final ITaskRepository _repository;

  GetAllTasksUseCase(this._repository);

  @override
  Future<(ITaskError?, Tasks?)> call(String userId) async {
    return await _repository.getAllTasks(userId);
  }
}
