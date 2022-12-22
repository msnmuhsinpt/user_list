part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserApiEvent extends UserEvent {
  const UserApiEvent();

  @override
  List<Object?> get props => [];
}
