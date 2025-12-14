import 'package:flutter_test/flutter_test.dart';
import 'package:counter/domain/entities/counter_entity.dart';
import 'package:counter/domain/use_cases/counter_change.dart';

void main() {
  group('CounterChange', () {
    test('should store the delta value', () {
      final counterChange = CounterChange(5);
      expect(counterChange.delta, equals(5));
    });

    test('should increment counter when delta is positive', () {
      final counterChange = CounterChange(3);
      final entity = CounterEntity(value: 10);

      final result = counterChange(entity);

      expect(result.value, equals(13));
    });

    test('should decrement counter when delta is negative', () {
      final counterChange = CounterChange(-2);
      final entity = CounterEntity(value: 10);

      final result = counterChange(entity);

      expect(result.value, equals(8));
    });

    test('should return same value when delta is zero', () {
      final counterChange = CounterChange(0);
      final entity = CounterEntity(value: 10);

      final result = counterChange(entity);

      expect(result.value, equals(10));
    });

    test('should return a new CounterEntity instance', () {
      final counterChange = CounterChange(1);
      final entity = CounterEntity(value: 5);

      final result = counterChange(entity);

      expect(result, isA<CounterEntity>());
      expect(identical(result, entity), isFalse);
    });

    test('should work when initial value is zero', () {
      final counterChange = CounterChange(7);
      final entity = CounterEntity(value: 0);

      final result = counterChange(entity);

      expect(result.value, equals(7));
    });

    test('should handle negative initial value', () {
      final counterChange = CounterChange(3);
      final entity = CounterEntity(value: -5);

      final result = counterChange(entity);

      expect(result.value, equals(-2));
    });

    test('should not mutate the original entity', () {
      final counterChange = CounterChange(10);
      final entity = CounterEntity(value: 4);

      counterChange(entity);

      expect(entity.value, equals(4));
    });
  });
}
