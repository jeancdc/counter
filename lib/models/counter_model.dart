class CounterModel {
  int value;

  CounterModel({this.value = 0});

  void increment() => value++;

  void decrement() => value--;
}
