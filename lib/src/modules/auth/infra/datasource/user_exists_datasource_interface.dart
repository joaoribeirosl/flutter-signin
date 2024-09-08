import 'dart:typed_data';

abstract class IUserExistsDatasource {
  Future<Uint8List?> userExists(String username);
}
