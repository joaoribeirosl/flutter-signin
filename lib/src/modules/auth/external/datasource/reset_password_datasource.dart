import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/external/server_address.dart';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/reset_password_datasource_interface.dart';
import 'package:http/http.dart' as http;

class ResetPasswordDatasource implements IResetPasswordDatasource {
  final http.Client _client;
  final AuthAdapter authAdapter = AuthAdapter();

  ResetPasswordDatasource(this._client);

  @override
  Future<bool?> resetPassword(String newPassword) async {
    try {
      final res = await _client.post(Uri.parse(resetPasswordRoute),
          headers: {'password': newPassword});
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw ServerError('error to connect with server, $e');
    }
    return null;
  }
}
