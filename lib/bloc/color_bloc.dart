import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(Colors.purple));

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    yield (event is ToAmber)
        ? ColorState(Colors.amber)
        : (event is ToBlue)
            ? ColorState(Colors.blueAccent)
            : ColorState(Colors.redAccent);
  }
}
