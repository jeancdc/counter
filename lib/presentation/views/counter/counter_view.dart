import 'package:counter/presentation/view_models/counter_viewmodel.dart';
import 'package:counter/presentation/views/counter/widgets/minus_button.dart';
import 'package:counter/presentation/views/counter/widgets/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter - A simple MVVM & clean architecture',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Current value:'),
          Text(
            '${viewModel.count}',
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              MinusButton(onPressed: viewModel.decrementCounter),
              PlusButton(onPressed: viewModel.incrementCounter)
            ],
          ),
        ],
      ),
    );
  }
}
