import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class MainModule extends Module {

  @override
  void binds(i) {
    i.add(http.Client.new);
  }

  // @override
  // void routes(r) {
  //   r.child(
  //     Modular.initialRoute,
  //     child: (context) => const MainPage(),
  //     children: [
       
  //     ],
  //   );
  // }
  

  
}