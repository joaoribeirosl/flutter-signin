import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/external/server_address.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/edit_task_by_id_datasource_interface.dart';
import 'package:http/http.dart' as http;

class EditTaskByIdDatasource implements IEditTaskByIdDatasource {
  final http.Client _client;
  final TaskAdapter taskAdapter = TaskAdapter();

  EditTaskByIdDatasource(this._client);

  @override
  Future<bool?> editTaskById(Uint8List actualTaskEncoded) async {
    try {
      final res = await _client.put(Uri.parse(editTaskByIdRoute),
          body: actualTaskEncoded);
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw ServerError('error to connect with server, $e');
    }
    return null;
  }
}
