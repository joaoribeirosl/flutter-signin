import 'package:flutter/material.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/external/server_address.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/socket_client_interface.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketClient implements ISocketClient {
  late final io.Socket socket;

  final Map<String, Function> handlersConnect = <String, Function>{};
  final Map<String, Function> handlersDisconnect = <String, Function>{};

  SocketClient() {
    connectToServer();
  }

  @override
  Future<void> connectToServer() async {
    socket = io.io(counterTasksRoute, {
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((data) => _runOnSocketConnect(data));
    socket.onDisconnect((data) => _runOnSocketDisconnect(data));
  }

  @override
  void emitData(String event, dynamic message) {
    socket.emit(event, message);
  }

  @override
  void listenEvent(String event, Function function) {
    socket.on(event, (data) => function(data));
  }

  @override
  void disposeEvent(String event) {
    socket.off(event);
  }

  @override
  void onSocketConnectHandler(Function function, String handler) {
    handlersConnect.addAll({handler: function});
    debugPrint('Listener connect: $handler');
  }

  @override
  void onSocketConnectDispose(String handler) {
    handlersConnect.remove(handler);
    debugPrint('Dispose connect: $handler');
  }

  void _runOnSocketConnect(data) {
    for (Function function in handlersConnect.values) {
      function(data);
    }
    debugPrint('Handlers connect: ${handlersConnect.length}');
  }

  void _runOnSocketDisconnect(data) {
    for (Function function in handlersDisconnect.values) {
      function(data);
    }
    debugPrint('Handlers disconnect: ${handlersConnect.length}');
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
  bool sockectConnected() {
    return socket.connected;
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
  void onSocketDisconnectDispose(String handler) {
    handlersDisconnect.remove(handler);
    debugPrint('Dispose disconnect: $handler');
  }

  @override
  void onSocketDisconnectHandler(Function function, String handler) {
    handlersDisconnect.addAll({handler: function});
    debugPrint('Listener disconnect: $handler');
  }
}
