import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterplugin/bloc/counter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial());

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    if (event is ToAmber) {
      yield ColorPicker(Colors.amber);
    } else if (event is ToBlue) {
      yield ColorPicker(Colors.blue);
    } else {
      yield ColorPicker(Colors.red);
    }

    // yield (event is ToAmber)
    //     ? ColorState(Colors.amber)
    //     : (event is ToBlue)
    //         ? ColorState(Colors.blueAccent)
    //         : ColorState(Colors.redAccent);
  }
}
