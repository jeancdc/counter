import 'package:counter/domain/use_cases/counter_change.dart';

class DecrementCounter extends CounterChange {
  DecrementCounter() : super(-1);
}
