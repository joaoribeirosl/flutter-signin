import 'dart:typed_data';

abstract class ISigninDatasource {
  Future<Uint8List?> login(Uint8List userEncoded);
}
