import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/sign_in.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';
import 'package:http/http.dart' as http;

class AuthModule extends Module {
  @override
  void binds(i) {
    i.add(http.Client.new);
    i.addSingleton(AuthStore.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SignInPage(),
      children: [],
    );
  }
}
