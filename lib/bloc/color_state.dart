part of 'color_bloc.dart';

@immutable
class ColorState extends Equatable {
  const ColorState();

  // final Color color;
  // ColorState(this.color);
  @override
  List<Object?> get props => [];
}

class ColorInitial extends ColorState {}

class ColorPicker extends ColorState {
  final Color color;
  ColorPicker(this.color);

  @override
  List<Object> get props => [color];
}
