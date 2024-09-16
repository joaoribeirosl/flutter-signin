import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/user/infra/socket_client_interface.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = IUserStore with _$UserStore;

abstract class IUserStore with Store {
  final ISocketClient _socketClient;

  IUserStore(this._socketClient);

  @observable
  String title = "";

  String oldRoute = "";

  @observable
  String taskCount = '';

  @action
  void changeRoute(String title, String route) {
    if (route != oldRoute) {
      final beforeTitle = this.title;
      this.title = title;

      final routeName = getRouteNameByNewRoute(route);

      if (beforeTitle.toLowerCase() == 'task') {
        Modular.to.pushNamed(routeName);
      } else {
        Modular.to.pushReplacementNamed(routeName);
      }
    }
  }

  String getRouteNameByNewRoute(String newRoute) {
    var path = '';
    final routePath = Modular.to.path;
    final routeSplit = routePath.split('/');
    oldRoute = newRoute;

    if (routeSplit.length <= 3) {
      path = '../$newRoute/';
    } else {
      path = '../../$newRoute/';
    }
    return path;
  }

  String shortenedName(String username) {
    int maxLength = 10;
    if (username.length > maxLength) {
      return '${username.substring(0, maxLength)}...';
    }
    return username;
  }

  void connectSocket() async {
    await _socketClient.connectToServer();
  }

  Future sendTaskIo(String idUser) async {
    _socketClient.emitData('update_request', idUser);
  }

  Future getTaskCount() async {
    return _socketClient.listenEvent('update_response', taskCountIo);
  }

  String taskCountIo(String data) {
    taskCount = data;
    return data;
  }
}
