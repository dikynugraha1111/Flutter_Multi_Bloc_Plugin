part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  final int amount;

  CounterEvent(this.amount);
}

class Increament extends CounterEvent {
  Increament(int amount) : super(amount);
}

class Decreament extends CounterEvent {
  Decreament(int amount) : super(amount);
}
