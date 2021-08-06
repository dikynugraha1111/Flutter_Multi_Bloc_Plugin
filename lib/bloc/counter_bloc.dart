import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield (event is Increament)
        ? CounterState(state.value + 1)
        : CounterState(state.value - 1);
  }
}
