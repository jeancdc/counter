import 'package:counter/domain/use_cases/counter_change.dart';
import 'package:counter/domain/use_cases/decrement_counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DecrementCounter', () {
    late DecrementCounter decrementCounter;

    setUp(() {
      decrementCounter = DecrementCounter();
    });

    test('should be a subclass of CounterChange', () {
      expect(decrementCounter, isA<CounterChange>());
    });

    test('should have a delta value of -1', () {
      expect(decrementCounter.delta, equals(-1));
    });

    test('should create a new instance with delta = -1 each time', () {
      final another = DecrementCounter();
      expect(another.delta, equals(-1));
    });

    test('two instances should have the same delta value', () {
      final a = DecrementCounter();
      final b = DecrementCounter();
      expect(a.delta, equals(b.delta));
    });
  });
}
