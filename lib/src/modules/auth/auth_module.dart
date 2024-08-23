import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/signin_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/signup_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';
import 'package:flutter_signin/src/modules/tasks/task_module.dart';
import 'package:http/http.dart' as http;

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);
    i.addSingleton(AuthStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const SignInPage());
    r.child('/signup_page/', child: (context) => const SignUpPage());
    r.module('/task_module/', module: TaskModule());
  }
}
