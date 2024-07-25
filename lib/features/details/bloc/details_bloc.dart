import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_list/features/api/api.dart';

import '../../api/models/models.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc({required this.userListClient}) : super(DetailsInitial()) {
    on<LoadDetailsEvent>(_onLoadUserDetails);
  }

  final UserListClient userListClient;

  Future<void> _onLoadUserDetails(
      LoadDetailsEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoading());
    try {
      final user = await userListClient.getUserDetails(event.id);
      emit(DetailsLoaded(user: user));
    } catch (error) {
      log(error.toString());
      emit(DetailsError(error: error));
    }
  }
}
