import 'package:counter/presentation/views/counter/widgets/operator_button.dart';
import 'package:counter/presentation/views/counter/widgets/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should display an OperatorButton with Icons.add icon', (
    WidgetTester tester,
  ) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: PlusButton())),
    );

    // Assert
    expect(find.byType(OperatorButton), findsOneWidget);
    final operator = tester.widget<OperatorButton>(find.byType(OperatorButton));
    expect(operator.iconData, Icons.add);
  });

  testWidgets('It should trigger the onPressed callback on the button click', (
    WidgetTester tester,
  ) async {
    // Arrange
    var pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PlusButton(
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byType(OperatorButton));
    await tester.pump();

    // Assert
    expect(pressed, isTrue);
  });
}
