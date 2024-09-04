import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signin_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signup_use_case.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/user_exists_use_case.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/reset_password_datasource.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/signin_datasource.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/signup_datasource.dart';
import 'package:flutter_signin/src/modules/auth/external/datasource/user_exists_datasource.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/reset_password_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signup_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/user_exists_datasource_interface.dart';
import 'package:flutter_signin/src/modules/auth/infra/repositories/auth_repository.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/reset_password_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/signin_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/signup_page.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';
import 'package:flutter_signin/src/modules/user/tasks/task_module.dart';
import 'package:http/http.dart' as http;

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);

    i.add<ISigninDatasource>(SigninDatasource.new);
    i.add<ISignupDatasource>(SignupDatasource.new);
    i.add<IResetPasswordDatasource>(ResetPasswordDatasource.new);
    i.add<IUserExistsDatasource>(UserExistsDatasource.new);

    i.add<IAuthRepository>(AuthRepository.new);

    i.add<ISigninUseCase>(SigninUseCase.new);
    i.add<ISignupUseCase>(SignupUseCase.new);
    i.add<IResetPasswordUseCase>(ResetPasswordUseCase.new);
    i.add<IUserExistsUseCase>(UserExistsUseCase.new);

    i.addSingleton(AuthStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const SignInPage());
    r.child('/signup_page/', child: (context) => const SignUpPage());
    r.child('/forgot_password_page/',
        child: (context) => const ResetPasswordPage());
    r.module('/task_module/', module: TaskModule());
  }
}
