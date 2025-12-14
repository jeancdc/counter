import 'package:counter/presentation/views/counter/widgets/operator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should display an ElevatedButton with a provided icon', (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: OperatorButton(iconData: Icons.abc)),
      ),
    );

    // Assert
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byIcon(Icons.abc), findsOneWidget);
  });

  testWidgets('It should trigger the onPressed callback on the button click', (
    WidgetTester tester,
  ) async {
    // Arrange
    var pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OperatorButton(
            iconData: Icons.abc,
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assert
    expect(pressed, isTrue);
  });
}
