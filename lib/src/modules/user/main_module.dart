import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/user/tasks/presenter/pages/task_page.dart';
import 'package:http/http.dart' as http;

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const TaskPage(
        user: null,
      ),
      // children: [
      //   ModuleRoute('/profile_module/',
      //       module: ProfileModule(), transition: TransitionType.fadeIn),
      // ],
    );
  }
}
