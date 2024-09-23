import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/domain/usecases/signin_use_case.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signin_use_case.test.mocks.dart';

@GenerateMocks([ISigninUseCase])
void main() {
  late ISigninUseCase signinUseCase;

  setUp() {
    signinUseCase = MockISigninUseCase();
  }

  test('successfully signin', () async {
    final user = User();
    when(signinUseCase.call(user)).thenAnswer(
        (_) async => Future<(IAuthError?, User?)>.value((null, user)));
  });
}
