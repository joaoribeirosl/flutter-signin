import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

abstract class ISignupDatasource {
  Future<Uint8List?> signup(User user);
}
