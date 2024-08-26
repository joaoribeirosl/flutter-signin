import 'dart:typed_data';

abstract class ISignupDatasource {
  Future<bool?> signup(Uint8List userEncoded);
}
