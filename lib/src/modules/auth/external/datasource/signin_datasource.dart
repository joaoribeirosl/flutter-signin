import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/external/server_address.dart';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:http/http.dart' as http;

class SigninDatasource implements ISigninDatasource {
  final client = http.Client();
  final AuthAdapter authAdapter = AuthAdapter();

  @override
  Future<Uint8List?> login(User user) async {
    try {
      final req = authAdapter.protoToData(user);
      if (req == null) return null;

      final res = await client.post(
        Uri.parse(signinRoute),
        body: req,
      );
      if (res.statusCode == 200) {
        return req;
      }
    } catch (e) {
      throw SigninError('error to signin, $e');
    }
    return null;
  }
}
