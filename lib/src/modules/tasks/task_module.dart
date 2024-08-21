import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/tasks/presenter/pages/task_page.dart';
import 'package:flutter_signin/src/modules/tasks/presenter/store/task_store.dart';
import 'package:http/http.dart' as http;

class TaskModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);
    i.addSingleton(TaskStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const TaskPage());
  }
}
