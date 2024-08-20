import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_signin_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  final client = http.Client();
  final AuthSigninAdapter authAdapter = AuthSigninAdapter();

  static const String apiUrl = String.fromEnvironment('API_URL', defaultValue: 'http://127.0.0.1:10100/');
  

  Future<User?> login() async {
    try {
      print(apiUrl);
      final res = await client.post(
        Uri.parse('http://127.0.0.1:10100/'),
      );
      if (res.statusCode == 200) {
        return authAdapter.dataFromProto(res.bodyBytes);
      }
      return null;
    } catch (e) {
      throw Exception('route error');
    }
  }
}