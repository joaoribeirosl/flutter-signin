import 'package:flutter/material.dart';
import 'package:flutter_signin/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('user can signin', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('usernameTextField')), 'jooo');

    await tester.pumpAndSettle();
  });
}
