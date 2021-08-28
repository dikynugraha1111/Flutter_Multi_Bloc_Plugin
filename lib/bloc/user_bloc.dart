import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterplugin/State_Bloc/User.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is ChangeName) {
      yield UserLoaded(User(name: event.changeName, age: state.user.age));
    } else if (event is ChangeAge) {
      yield UserLoaded(User(name: state.user.name, age: state.user.age + 1));
    }
  }
}
