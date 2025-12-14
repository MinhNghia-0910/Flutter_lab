// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:bai1/main.dart';

void main() {
  testWidgets('Change color cycles through list', (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());

    expect(find.text('Green'), findsOneWidget);
    expect(find.text('Red'), findsNothing);

    await tester.tap(find.text('Change Color'));
    await tester.pumpAndSettle();

    expect(find.text('Red'), findsOneWidget);
  });
}
