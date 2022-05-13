import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end-to-end test',
    () {
      testWidgets(
        'tap Details button',
        (final WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          expect(find.text('Friends'), findsOneWidget);

          const key = Key("1");
          // Tap the 'Details button and push
          await tester.tap(find.byKey(key));
        },
      );
    },
  );
}
