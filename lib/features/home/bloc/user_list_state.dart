part of 'user_list_bloc.dart';

sealed class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

final class UseListInitial extends UserListState {}

final class UserListLoading extends UserListState {}

final class UserListLoaded extends UserListState {
  const UserListLoaded({
    required this.userList,
  });

  final UserList userList;

  @override
  List<Object> get props => [userList];
}

final class UserListError extends UserListState {
  const UserListError({
    required this.error,
  });

  final Object error;

  @override
  List<Object> get props => [error];
}
