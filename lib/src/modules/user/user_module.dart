import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/user/presenter/pages/user_page.dart';
import 'package:flutter_signin/src/modules/user/presenter/store/user_store.dart';
import 'package:flutter_signin/src/modules/user/submodules/profile/profile_module.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/task_module.dart';
import 'package:http/http.dart' as http;

class UserModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);

    i.addSingleton(UserStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const UserPage(),
      children: [
        ModuleRoute('/task/', module: TaskModule()),
        ModuleRoute('/profile/', module: ProfileModule()),
      ],
    );
  }
}
