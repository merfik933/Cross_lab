import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_15/main.dart';

void main() {
  testWidgets('Home page displays correct text', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify the presence of the text
    expect(find.text('IPZ: Anatoliy\'s last Flutter App'), findsOneWidget);
  });

  testWidgets('Home page has a FloatingActionButton', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify the presence of the FloatingActionButton
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
