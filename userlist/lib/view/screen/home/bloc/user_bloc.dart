import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/data/api/user_reponse.dart';

import '../../../../data/service/apiservice.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final APIService _apiService;

  UserBloc(this._apiService) : super(UserInitialState()) {
    on<UserApiEvent>((event, emit) async {
      emit(UserLoadingState());
      final response = await _apiService.getUser();
      emit(UserLoadedState(response));
    });
  }
}
