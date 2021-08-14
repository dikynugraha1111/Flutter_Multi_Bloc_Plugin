part of 'counter_bloc.dart';

@immutable
class CounterState extends Equatable {
  const CounterState();
  // final int value;

  // CounterState(this.value);

  @override
  List<Object?> get props => [];
}

class CounterInitial extends CounterState {}

class CounterValue extends CounterState {
  final int value;

  CounterValue(this.value);

  @override
  List<Object> get props => [value];
}

// class CounterInitial extends CounterState {
//   final int value;
//   // final Color color;

//   CounterInitial(this.value);
// }
