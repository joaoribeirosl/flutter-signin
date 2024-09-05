import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class ProfileModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: child);
  }
}
