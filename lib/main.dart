import 'package:counter/domain/use_cases/decrement_counter.dart';
import 'package:counter/domain/use_cases/increment_counter.dart';
import 'package:counter/presentation/view_models/counter_viewmodel.dart';
import 'package:counter/presentation/views/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// coverage:ignore-start
void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => IncrementCounter()),
        Provider(create: (_) => DecrementCounter()),
        ChangeNotifierProxyProvider2<
          IncrementCounter,
          DecrementCounter,
          CounterViewModel
        >(
          create: (_) => CounterViewModel(
            incrementCounterUseCase: IncrementCounter(),
            decrementCounterUseCase: DecrementCounter(),
          ),
          update: (_, incrementCounter, decrementCounter, _) =>
              CounterViewModel(
                incrementCounterUseCase: incrementCounter,
                decrementCounterUseCase: decrementCounter,
              ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
// coverage:ignore-end

class MyApp extends StatelessWidget {
  const MyApp({this.home = const CounterView(), super.key});

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: home,
    );
  }
}
