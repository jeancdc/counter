import 'package:counter/viewmodels/counter_viewmodel.dart';
import 'package:counter/views/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// coverage:ignore-start
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: const MyApp(),
    ),
  );
}
// coverage:ignore-end

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const CounterView(),
    );
  }
}
