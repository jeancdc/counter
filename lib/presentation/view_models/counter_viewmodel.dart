import 'package:counter/domain/entities/counter_entity.dart';
import 'package:counter/domain/use_cases/decrement_counter.dart';
import 'package:counter/domain/use_cases/increment_counter.dart';
import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  final IncrementCounter incrementCounterUseCase;
  final DecrementCounter decrementCounterUseCase;

  CounterViewModel({
    required this.incrementCounterUseCase,
    required this.decrementCounterUseCase,
  });

  int _count = 0;

  int get count => _count;

  void _apply(CounterEntity Function(CounterEntity) fn) {
    final counter = fn(CounterEntity(value: count));
    _count = counter.value;
    notifyListeners();
  }

  void incrementCounter() => _apply(incrementCounterUseCase.call);

  void decrementCounter() => _apply(decrementCounterUseCase.call);
}
