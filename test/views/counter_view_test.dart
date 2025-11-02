import 'package:counter/viewmodels/counter_viewmodel.dart';
import 'package:counter/views/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockCounterViewModel extends Mock implements CounterViewModel {}

void main() {
  late MockCounterViewModel mockCounterViewModel;
  late CounterViewModel counterViewModel;
  late ChangeNotifierProvider changeNotifierProvider;

  group('Widget tests with mock implementation of CounterViewModel', () {
    setUp(() {
      mockCounterViewModel = MockCounterViewModel();
      changeNotifierProvider = ChangeNotifierProvider<CounterViewModel>.value(
        value: mockCounterViewModel,
        child: const MaterialApp(home: CounterView()),
      );
    });

    testWidgets('It should display the current value of the counter', (
      tester,
    ) async {
      when(() => mockCounterViewModel.counter).thenReturn(0);

      await tester.pumpWidget(changeNotifierProvider);

      expect(find.text('Current value:'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('It should increment the value of the counter', (tester) async {
      when(() => mockCounterViewModel.counter).thenReturn(0);

      await tester.pumpWidget(changeNotifierProvider);

      // Click on the '+' button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      verify(() => mockCounterViewModel.incrementCounter());
    });

    testWidgets('It should decrement the value of the counter', (tester) async {
      when(() => mockCounterViewModel.counter).thenReturn(0);

      await tester.pumpWidget(changeNotifierProvider);

      // Click on the '-' button
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      verify(() => mockCounterViewModel.decrementCounter());
    });
  });

  group('Widget tests with real implementation of CounterViewModel', () {
    setUp(() {
      counterViewModel = CounterViewModel();
      changeNotifierProvider = ChangeNotifierProvider<CounterViewModel>.value(
        value: counterViewModel,
        child: const MaterialApp(home: CounterView()),
      );
    });

    testWidgets('It should increment and decrement the value of the counter', (
      tester,
    ) async {
      await tester.pumpWidget(changeNotifierProvider);

      expect(find.text('Current value:'), findsOneWidget);

      // Initial value
      expect(find.text('0'), findsOneWidget);

      // Click on the '+' button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);

      // Click on the '-' button
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });
  });
}
