import 'dart:typed_data';

abstract class IGetAllTasksDatasource {
  Future<Uint8List?> getAllTasks(String idUser);
}
