import 'package:counter/main.dart';
import 'package:counter/viewmodels/counter_viewmodel.dart';
import 'package:counter/views/counter_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('It should mount MyApp and display the CounterView widget', (
    tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<CounterViewModel>(
        create: (_) => CounterViewModel(),
        child: const MyApp(),
      ),
    );

    expect(find.byType(MyApp), findsOneWidget);
    expect(find.byType(CounterView), findsOneWidget);
  });
}
