import 'dart:typed_data';

abstract class ISignupDatasource {
  Future<Uint8List?> signup(Uint8List userEncoded);
}
