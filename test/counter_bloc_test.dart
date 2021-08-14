import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutterplugin/bloc/counter_bloc.dart';

void main() {
  group("Testing Counter Bloc", () {
    blocTest("Testing Increament",
        build: () => CounterBloc(),
        act: (CounterBloc blocnya) async => {
              blocnya.add(Increament(1)),
            },
        expect: () => []);
  });
}
