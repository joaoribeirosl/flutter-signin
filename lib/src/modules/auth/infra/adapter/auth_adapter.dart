import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
class AuthAdapter {


  User? dataFromProto(Uint8List data) {
    try {
      return User.fromBuffer(data);
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }

  Uint8List? protoToData(User data) {
    try {
      return data.writeToBuffer();
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }

}