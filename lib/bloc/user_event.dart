part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends UserEvent {
  final String changeName;

  ChangeName(this.changeName);
}

class ChangeAge extends UserEvent {}
