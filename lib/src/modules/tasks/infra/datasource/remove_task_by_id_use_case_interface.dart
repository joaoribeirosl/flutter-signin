import 'dart:typed_data';

abstract class IRemoveTaskByIdDatasource {
  Future<bool?> removeTaskById(Uint8List taskIdEncoded);
}
