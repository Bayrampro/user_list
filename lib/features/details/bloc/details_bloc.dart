import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_list/features/api/api.dart';
import 'package:user_list/features/api/models/user.dart';
import 'package:user_list/hive/user_hv.dart';
import 'package:user_list/utils/models_converter.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc({required this.userListClient}) : super(DetailsInitial()) {
    on<LoadDetailsEvent>(_onLoadUserDetails);
  }

  final UserListClient userListClient;
  final Box<UserHv> userCacheBox = Hive.box<UserHv>('userBox');

  Future<void> _onLoadUserDetails(
      LoadDetailsEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoading());

    final cachedUser = userCacheBox.get(event.id);
    if (cachedUser != null) {
      emit(DetailsLoaded(
          user: ModelsConverter().convertHiveUserToApiUser(cachedUser)));
    }

    try {
      final apiUser = await userListClient.getUserDetails(event.id);
      userCacheBox.put(
          event.id, ModelsConverter().convertApiUserToHiveUser(apiUser));
      emit(DetailsLoaded(user: apiUser));
    } catch (error) {
      log(error.toString());
      emit(DetailsError(error: error));
    }
  }
}
