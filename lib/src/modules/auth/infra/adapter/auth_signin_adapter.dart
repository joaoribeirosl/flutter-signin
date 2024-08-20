import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

class AuthSigninAdapter {
  User? dataFromProto(Uint8List data) {
    try {
      return User.fromBuffer(data);
    } catch (e) {
      debugPrint('decode error: $e');
    }
    return null;
  }
}