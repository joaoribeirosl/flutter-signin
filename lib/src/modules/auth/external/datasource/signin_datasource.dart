import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/external/server_address.dart';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource_interface.dart';
import 'package:http/http.dart' as http;

class SigninDatasource implements ISigninDatasource {
  final http.Client _client;
  final AuthAdapter authAdapter = AuthAdapter();

  SigninDatasource(this._client);

  @override
  Future<Uint8List?> login(Uint8List userEncoded) async {
    try {
      final res = await _client.post(
        Uri.parse(signinRoute),
        body: userEncoded,
      );
      if (res.statusCode == 200) {
        return res.bodyBytes;
      }
    } catch (e) {
      throw SigninError('error to signin, $e');
    }
    return null;
  }
}
