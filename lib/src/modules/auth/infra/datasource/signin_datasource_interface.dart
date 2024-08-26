import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

abstract class ISigninDatasource {
  Future<Uint8List?> login(User user);
}
