import 'package:counter/domain/entities/counter_entity.dart';

class CounterChange {
  final int delta;

  CounterChange(this.delta);

  CounterEntity call(CounterEntity entity) =>
      CounterEntity(value: entity.value + delta);
}
