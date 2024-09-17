import 'dart:typed_data';

abstract class IEditTaskByIdDatasource {
  Future<bool?> editTaskById(Uint8List actualTaskEncoded);
}
