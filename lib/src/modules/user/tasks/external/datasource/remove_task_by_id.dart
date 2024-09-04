import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/user/tasks/external/server_address.dart';
import 'package:flutter_signin/src/modules/user/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/user/tasks/infra/datasource/remove_task_by_id_use_case_interface.dart';
import 'package:http/http.dart' as http;

class RemoveTaskByIdDatasource implements IRemoveTaskByIdDatasource {
  final http.Client _client;
  final TaskAdapter taskAdapter = TaskAdapter();

  RemoveTaskByIdDatasource(this._client);

  @override
  Future<bool?> removeTaskById(String idTask) async {
    try {
      final res = await _client
          .delete(Uri.parse(removeTaskByIdRoute), headers: {'id': idTask});
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw ServerError('error to connect with server, $e');
    }
    return null;
  }
}
