import 'package:counter/domain/entities/counter_entity.dart';
import 'package:counter/domain/use_cases/decrement_counter.dart';
import 'package:counter/domain/use_cases/increment_counter.dart';
import 'package:counter/presentation/view_models/counter_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIncrementCounter extends Mock implements IncrementCounter {}

class MockDecrementCounter extends Mock implements DecrementCounter {}

void main() {
  late MockIncrementCounter mockIncrementCounter;
  late MockDecrementCounter mockDecrementCounter;
  late CounterViewModel counterViewModel;
  late bool isListenerNotified;

  setUpAll(() {
    registerFallbackValue(CounterEntity());
  });

  setUp(() {
    mockIncrementCounter = MockIncrementCounter();
    mockDecrementCounter = MockDecrementCounter();

    counterViewModel = CounterViewModel(
      incrementCounterUseCase: mockIncrementCounter,
      decrementCounterUseCase: mockDecrementCounter,
    );

    counterViewModel.addListener(() {
      isListenerNotified = true;
    });

    isListenerNotified = false;
  });

  group('incrementCounter', () {
    test('It should set the counter value and notify the listener', () {
      // Arrange
      final initial = counterViewModel.count;
      final incremented = CounterEntity(value: initial + 1);

      when(
        () => mockIncrementCounter.call(any<CounterEntity>()),
      ).thenReturn(incremented);

      // Act
      counterViewModel.incrementCounter();

      // Assert
      verify(
        () => mockIncrementCounter.call(
          any(
            that: isA<CounterEntity>().having((e) => e.value, 'value', initial),
          ),
        ),
      );
      expect(counterViewModel.count, incremented.value);
      expect(isListenerNotified, isTrue);
    });
  });

  group('decrementCounter', () {
    test('It should set the counter value and notify the listener', () {
      // Arrange
      final initial = counterViewModel.count;
      final decremented = CounterEntity(value: initial - 1);

      when(
        () => mockDecrementCounter.call(any<CounterEntity>()),
      ).thenReturn(decremented);

      // Act
      counterViewModel.decrementCounter();

      // Assert
      verify(
        () => mockDecrementCounter.call(
          any(
            that: isA<CounterEntity>().having((e) => e.value, 'value', initial),
          ),
        ),
      );
      expect(counterViewModel.count, decremented.value);
      expect(isListenerNotified, isTrue);
    });
  });
}
