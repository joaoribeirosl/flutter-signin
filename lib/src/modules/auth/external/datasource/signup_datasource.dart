import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/external/server_address.dart';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signup_datasource_interface.dart';
import 'package:http/http.dart' as http;

class SignupDatasource implements ISignupDatasource {
  final http.Client _client;
  final AuthAdapter authAdapter = AuthAdapter();

  SignupDatasource(this._client);

  @override
  Future<bool?> signup(Uint8List userEncoded) async {
    try {
      final res = await _client.post(
        Uri.parse(signupRoute),
        body: userEncoded,
      );
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw ServerError('error to connect with server, $e');
    }
    return null;
  }
}
