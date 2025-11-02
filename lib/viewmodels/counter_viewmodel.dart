import 'package:counter/models/counter_model.dart';
import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counterModel;

  CounterViewModel([CounterModel? counterModel])
    : _counterModel = counterModel ?? CounterModel();

  int get counter => _counterModel.value;

  void incrementCounter() {
    _counterModel.increment();
    notifyListeners();
  }

  void decrementCounter() {
    _counterModel.decrement();
    notifyListeners();
  }
}
