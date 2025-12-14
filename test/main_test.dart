import 'package:counter/main.dart';
import 'package:counter/presentation/view_models/counter_viewmodel.dart';
import 'package:counter/presentation/views/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockCounterViewModel extends Mock implements CounterViewModel {}

Future<void> pumpTestApp(
  WidgetTester tester, {
  required CounterViewModel viewModel,
}) async {
  await tester.pumpWidget(
    ChangeNotifierProvider<CounterViewModel>.value(
      value: viewModel,
      child: const MyApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  late CounterViewModel mockCounterViewModel;

  setUp(() {
    mockCounterViewModel = MockCounterViewModel();

    when(() => mockCounterViewModel.count).thenReturn(0);
    when(() => mockCounterViewModel.incrementCounter()).thenAnswer((_) {});
    when(() => mockCounterViewModel.decrementCounter()).thenAnswer((_) {});
  });

  testWidgets('It should configure MaterialApp', (tester) async {
    await tester.pumpWidget(const MyApp(home: Placeholder()));

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

    expect(materialApp.debugShowCheckedModeBanner, false);
    expect(materialApp.title, 'Counter');
    expect(materialApp.home, isA<Placeholder>());
  });

  testWidgets('It should mount MyApp and display the CounterView widget', (
    tester,
  ) async {
    await pumpTestApp(tester, viewModel: mockCounterViewModel);

    expect(find.byType(MyApp), findsOneWidget);
    expect(find.byType(CounterView), findsOneWidget);
  });
}
