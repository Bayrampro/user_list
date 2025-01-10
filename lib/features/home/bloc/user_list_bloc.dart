import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:user_list/features/api/api.dart';
import 'package:user_list/hive/user_hv.dart';
import 'package:user_list/features/api/models/user.dart';
import 'package:user_list/utils/models_converter.dart';

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

    final userBox = await Hive.openBox<UserHv>('userBox');

    try {
      if (userBox.isNotEmpty) {
        final cachedUsers = userBox.values
            .map((hiveUser) =>
                ModelsConverter().convertHiveUserToApiUser(hiveUser))
            .toList();
        emit(UserListLoaded(userList: cachedUsers));
      } else {
        final apiUsers = await userListClient.getUsers();
        final hiveUsers = apiUsers
            .map((apiUser) =>
                ModelsConverter().convertApiUserToHiveUser(apiUser))
            .toList();
        for (final hiveUser in hiveUsers) {
          userBox.put(hiveUser.id, hiveUser);
        }
        emit(UserListLoaded(userList: apiUsers));
      }
    } catch (error) {
      log(error.toString());
      emit(UserListError(error: error));
    }
  }
}
