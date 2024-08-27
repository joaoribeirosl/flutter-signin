import 'dart:typed_data';
import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/external/server_address.dart';
import 'package:flutter_signin/src/modules/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/tasks/infra/datasource/get_all_tasks_datasource_interface.dart';
import 'package:http/http.dart' as http;

class GetAllTasksDatasource implements IGetAllTasksDatasource {
  final http.Client _client;
  final TaskAdapter taskAdapter = TaskAdapter();

  GetAllTasksDatasource(this._client);

  @override
  Future<Uint8List?> getAllTasks() async {
    try {
      final res = await _client.get(
        Uri.parse(getAllTasksRoute),
      );
      if (res.statusCode == 200) {
        return res.bodyBytes;
      }
    } catch (e) {
      throw ServerError('error to connect with server, $e');
    }
    return null;
  }
}
