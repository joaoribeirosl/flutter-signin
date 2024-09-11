import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/user_exists_datasource_interface.dart';
// import 'package:http/http.dart' as http;

class UserExistsDatasource implements IUserExistsDatasource {
  // final http.Client _client;
  final AuthAdapter authAdapter = AuthAdapter();

  // UserExistsDatasource(this._client);

  @override
  Future<Uint8List?> userExists(String username) {
    throw UnimplementedError();
  }
}
