import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signin_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/user_exists_use_case.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/reset_password_datasource.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/signin_datasource.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/signup_datasource.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/socket_client.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/user_exists_datasource.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/reset_password_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signup_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/user_exists_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/infra/socket_client_interface.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/reset_password_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/signin_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/signup_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/reset_password_store.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/signin_store.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/signup_store.dart';
import 'package:flutter_signin/src/modules/user/user_module.dart';
import 'package:http/http.dart' as http;

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);
    i.addSingleton<ISocketClient>(SocketClient.new);

    i.add<ISigninDatasource>(SigninDatasource.new);
    i.add<ISignupDatasource>(SignupDatasource.new);
    i.add<IResetPasswordDatasource>(ResetPasswordDatasource.new);
    i.add<IUserExistsDatasource>(UserExistsDatasource.new);

    i.add<IAuthRepository>(AuthRepository.new);

    i.add<ISigninUseCase>(SigninUseCase.new);
    i.add<ISignupUseCase>(SignupUseCase.new);
    i.add<IResetPasswordUseCase>(ResetPasswordUseCase.new);
    i.add<IUserExistsUseCase>(UserExistsUseCase.new);

    i.addSingleton(SigninStore.new);
    i.addSingleton(SignupStore.new);
    i.addSingleton(ResetPasswordStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const SignInPage());
    r.child('/signup_page/', child: (context) => const SignUpPage());
    r.child('/forgot_password_page/',
        child: (context) => const ResetPasswordPage());
    r.module('/user_module/', module: UserModule());
  }
}
