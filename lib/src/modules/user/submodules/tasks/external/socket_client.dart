import 'package:flutter_signin/src/modules/user/submodules/tasks/external/server_address.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/socket_client_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClient implements ISocketClient {
  final Socket socket = io(counterTasksRoute, {
    'transports': ['websocket'],
    'autoConnect': false,
  });
  

  SocketClient() {
    socket.connect();
  }

  bool socketConnected() {
    return socket.connected;
  }

  void sendMessage(String event, dynamic message) {
    socket.emit(event, message);
  }

  void receiveSimpleMessage(String event, Function function) {
    socket.on(event, (data) => function(data));
  }

  void onSocketDisconnect(Function function) {
    socket.onDisconnect((data) => function(data));
  }

  void onSocketConnect(Function function) {
    socket.onConnect((data) => function(data));
  }

  @override
  void onSocketConnectError(Function function) {
    socket.onConnectError((data) => function(data));
  }

  @override
  void onSocketError(Function function) {
    socket.onError((data) => function(data));
  }

  @override
  void onSocketReconnect(Function function) {
    socket.onReconnect((data) => function(data));
  }

  @override
  void disconnect() {
    socket.disconnect();
  }

  @override
  void dispose() {
    socket.dispose();
  }

  @override
  Future<void> connectToServer() {
    throw UnimplementedError();
  }

  @override
  void disposeEvent(String event) {}

  @override
  void emitData(String event, message) {}

  @override
  void listenEvent(String event, Function function) {}

  @override
  void onSocketConnectDispose(String handler) {}

  @override
  void onSocketConnectHandler(Function function, String handler) {}

  @override
  void onSocketDisconnectDispose(String handler) {}

  @override
  void onSocketDisconnectHandler(Function function, String handler) {}

  @override
  void receiveAdapterMessage(
      String event, Function functionAdapter, Function function) {}

  @override
  bool sockectConnected() {
    throw UnimplementedError();
  }
}
