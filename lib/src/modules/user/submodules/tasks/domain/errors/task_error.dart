abstract class ITaskError {
  String get message;
  String? get tracking;
}

class TaskError implements ITaskError {
  @override
  final String message;

  @override
  final String? tracking;

  TaskError(this.message, [this.tracking]);
}

class AddTaskError extends TaskError {
  AddTaskError(super.message, [super.tracking]);
}

class RemoveTaskError extends TaskError {
  RemoveTaskError(super.message, [super.tracking]);
}

class GetTasksError extends TaskError {
  GetTasksError(super.message, [super.tracking]);
}

class DecodeError extends TaskError {
  DecodeError(super.message, [super.tracking]);
}

class ServerError extends TaskError {
  ServerError(super.message, [super.tracking]);
}
