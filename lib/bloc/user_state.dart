part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final User user;
  const UserState(this.user);

  @override
  List<Object> get props => [user];
  //todo Ingat Props harus di isi boiii
}

class UserInitial extends UserState {
  UserInitial() : super(User(name: "No Name", age: 0));
}

class UserLoaded extends UserState {
  UserLoaded(User user) : super(user);
}
