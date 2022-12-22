part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final UserReponse response;

  const UserLoadedState(this.response);

  @override
  List<Object> get props => [response];
}

class ErrorState extends UserState {
  const ErrorState();

  @override
  List<Object> get props => [];
}

class UnAuthorizedState extends UserState {
  final String message;

  const UnAuthorizedState(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}

class NoInternetState extends UserState {
  const NoInternetState();

  @override
  List<Object?> get props => [];
}
