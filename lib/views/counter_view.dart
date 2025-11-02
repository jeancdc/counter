import 'package:counter/viewmodels/counter_viewmodel.dart';
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
          'Counter - A simple MVVM architecture',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current value:'),
            Text('${viewModel.counter}', style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: viewModel.decrementCounter,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: viewModel.incrementCounter,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
