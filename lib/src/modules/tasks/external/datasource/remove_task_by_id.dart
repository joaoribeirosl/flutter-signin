import 'package:flutter_signin/src/modules/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/tasks/infra/datasource/remove_task_by_id_use_case_interface.dart';
import 'package:http/http.dart' as http;

class RemoveTaskByIdDatasource implements IRemoveTaskByIdDatasource {
  final http.Client _client;
  final TaskAdapter taskAdapter = TaskAdapter();

  RemoveTaskByIdDatasource(this._client);

  @override
  Future<bool?> addTask(int id) {
    throw UnimplementedError();
  }
}
