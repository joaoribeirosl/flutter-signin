import 'dart:typed_data';

abstract class IAddTaskDatasource {
  Future<bool?> addTask(Uint8List taskEncoded);
}
