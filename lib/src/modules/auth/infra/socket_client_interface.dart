abstract class ISocketClient {
  Future<void> connectToServer();
  void emitData(String event, dynamic message);
  void listenEvent(String event, Function(String) function);
  void disposeEvent(String event);
  void onSocketConnectError(Function function);
  void onSocketError(Function function);
  void onSocketReconnect(Function function);
  void disconnect();
  void dispose();
  bool sockectConnected();
  void onSocketConnectHandler(Function function, String handler);
  void onSocketConnectDispose(String handler);
  void onSocketDisconnectHandler(Function function, String handler);
  void onSocketDisconnectDispose(String handler);
}
