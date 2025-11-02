import 'package:counter/models/counter_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('increment', () {
    test('It should increment the counter to 1', () {
      final counter = CounterModel();
      counter.increment();
      expect(counter.value, 1);
    });

    test('It should increment the counter to 3', () {
      final counter = CounterModel(value: 2);
      counter.increment();
      expect(counter.value, 3);
    });
  });

  group('decrement', () {
    test('It should increment the counter to -1', () {
      final counter = CounterModel();
      counter.decrement();
      expect(counter.value, -1);
    });

    test('It should decrement the counter to 2', () {
      final counter = CounterModel(value: 3);
      counter.decrement();
      expect(counter.value, 2);
    });
  });
}
