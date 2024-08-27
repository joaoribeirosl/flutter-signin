import 'dart:typed_data';
import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/external/server_address.dart';
import 'package:flutter_signin/src/modules/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/tasks/infra/datasource/add_task_datasource_interface.dart';
import 'package:http/http.dart' as http;

class AddTaskDatasource implements IAddTaskDatasource {
  final http.Client _client;
  final TaskAdapter taskAdapter = TaskAdapter();

  AddTaskDatasource(this._client);

  @override
  Future<bool?> addTask(Uint8List taskEncoded) async {
    try {
      final res = await _client.post(
        Uri.parse(addTaskRoute),
        body: taskEncoded,
      );
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw ServerError('error to connect with server, $e');
    }
    return null;
  }
}
