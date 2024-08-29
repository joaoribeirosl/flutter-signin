import 'dart:typed_data';

import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/external/server_address.dart';
import 'package:flutter_signin/src/modules/tasks/infra/adapter/task_adapter.dart';
import 'package:flutter_signin/src/modules/tasks/infra/datasource/remove_task_by_id_use_case_interface.dart';
import 'package:http/http.dart' as http;

class RemoveTaskByIdDatasource implements IRemoveTaskByIdDatasource {
  final http.Client _client;
  final TaskAdapter taskAdapter = TaskAdapter();

  RemoveTaskByIdDatasource(this._client);

  @override
  Future<bool?> removeTaskById(Uint8List taskIdEncoded) async {
    // try {
    //   final res = await _client.post(
    //     Uri.parse(removeTaskByIdRoute),
    //     body: taskIdEncoded,
    //   );
    //   if (res.statusCode == 200) {
    //     return true;
    //   }
    // } catch (e) {
    //   throw ServerError('error to connect with server, $e');
    // }
    // return null;
    throw UnimplementedError();
  }
}
