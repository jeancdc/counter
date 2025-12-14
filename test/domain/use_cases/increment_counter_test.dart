import 'package:flutter_test/flutter_test.dart';
import 'package:counter/domain/use_cases/counter_change.dart';
import 'package:counter/domain/use_cases/increment_counter.dart';

void main() {
  group('IncrementCounter', () {
    late IncrementCounter incrementCounter;

    setUp(() {
      incrementCounter = IncrementCounter();
    });

    test('should be a subclass of CounterChange', () {
      expect(incrementCounter, isA<CounterChange>());
    });

    test('should have a delta value of 1', () {
      expect(incrementCounter.delta, equals(1));
    });

    test('should create a new instance with delta = 1 each time', () {
      final another = IncrementCounter();
      expect(another.delta, equals(1));
    });

    test('two instances should have the same delta value', () {
      final a = IncrementCounter();
      final b = IncrementCounter();
      expect(a.delta, equals(b.delta));
    });
  });
}
