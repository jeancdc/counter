import 'package:counter/presentation/view_models/counter_viewmodel.dart';
import 'package:counter/presentation/views/counter/counter_view.dart';
import 'package:counter/presentation/views/counter/widgets/minus_button.dart';
import 'package:counter/presentation/views/counter/widgets/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockCounterViewModel extends Mock implements CounterViewModel {}

void main() {
  late CounterViewModel mockCounterViewModel;
  late ChangeNotifierProvider changeNotifierProvider;

  setUp(() {
    mockCounterViewModel = MockCounterViewModel();
    changeNotifierProvider = ChangeNotifierProvider<CounterViewModel>.value(
      value: mockCounterViewModel,
      child: const MaterialApp(home: CounterView()),
    );
  });

  group('CounterView Interaction Tests', () {
    testWidgets('It should display the current value of the counter', (
      tester,
    ) async {
      when(() => mockCounterViewModel.count).thenReturn(5);

      await tester.pumpWidget(changeNotifierProvider);

      expect(find.text('Current value:'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('It should call incrementCounter when PlusButton is pressed', (
      tester,
    ) async {
      when(() => mockCounterViewModel.count).thenReturn(0);

      await tester.pumpWidget(changeNotifierProvider);

      final plusButton = find.byType(PlusButton);
      expect(plusButton, findsOneWidget);

      await tester.tap(plusButton);
      await tester.pump();

      verify(() => mockCounterViewModel.incrementCounter());
    });

    testWidgets('It should call decrementCounter when MinusButton is pressed', (
      tester,
    ) async {
      when(() => mockCounterViewModel.count).thenReturn(0);

      await tester.pumpWidget(changeNotifierProvider);

      final minusButton = find.byType(MinusButton);
      expect(minusButton, findsOneWidget);

      await tester.tap(minusButton);
      await tester.pump();

      verify(() => mockCounterViewModel.decrementCounter());
    });
  });
}
