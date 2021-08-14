import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increament) {
      if (state is CounterInitial) {
        yield CounterValue(0);
      } else {
        yield CounterValue((state as CounterValue).value + event.amount);
      }
    }

    // CounterState(state.value + event.amount)
    // : CounterState(state.value - event.amount);
  }
}
