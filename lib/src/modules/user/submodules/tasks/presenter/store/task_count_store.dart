import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/socket_client_interface.dart';
import 'package:mobx/mobx.dart';

part 'task_count_store.g.dart';

// ignore: library_private_types_in_public_api
class TaskCountStore = _TaskCountStore with _$TaskCountStore;

abstract class _TaskCountStore with Store {
  final ISocketClient _socketClient;

  _TaskCountStore(this._socketClient);

  
}
