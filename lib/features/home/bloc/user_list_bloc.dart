import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_list/features/api/api.dart';
import 'package:user_list/features/api/models/models.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc({required this.userListClient}) : super(UseListInitial()) {
    on<LoadUserListEvent>(_onLoadUserList);
  }

  final UserListClient userListClient;

  Future<void> _onLoadUserList(
      LoadUserListEvent event, Emitter<UserListState> emit) async {
    emit(UserListLoading());
    try {
      final userList = await userListClient.getUsers();
      emit(UserListLoaded(userList: userList));
    } catch (error) {
      log(error.toString());
      emit(UserListError(error: error));
    }
  }
}
