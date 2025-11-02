import 'package:counter/models/counter_model.dart';
import 'package:counter/viewmodels/counter_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterModel extends Mock implements CounterModel {}

void main() {
  late CounterModel mockCounterModel;
  late CounterViewModel counterViewModel;
  late bool isListenerNotified;

  setUp(() {
    mockCounterModel = MockCounterModel();
    counterViewModel = CounterViewModel(mockCounterModel);
    isListenerNotified = false;
    counterViewModel.addListener(() => isListenerNotified = true);
  });

  group('CounterViewModel', () {
    test('It should set a default CounterViewModel', () {
      counterViewModel = CounterViewModel();
      expect(counterViewModel, isA<CounterViewModel>());
    });

    test('It should get the value 1 when the initial value is 1', () {
      when(() => mockCounterModel.value).thenReturn(1);
      final counterValue = counterViewModel.counter;
      expect(counterValue, 1);
    });
  });

  group('incrementCounter', () {
    test('It should call the increment method and notify listener', () {
      counterViewModel.incrementCounter();
      verify(() => mockCounterModel.increment());
      expect(isListenerNotified, isTrue);
    });
  });

  group('decrementCounter', () {
    test('It should call the decrement method and notify listener', () {
      counterViewModel.decrementCounter();
      verify(() => mockCounterModel.decrement());
      expect(isListenerNotified, isTrue);
    });
  });
}
