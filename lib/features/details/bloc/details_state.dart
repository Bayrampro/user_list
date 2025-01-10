part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsLoaded extends DetailsState {
  const DetailsLoaded({
    required this.user,
  });

  final User user;

  @override
  List<Object> get props => [user];
}

final class DetailsError extends DetailsState {
  const DetailsError({
    required this.error,
  });

  final Object error;

  @override
  List<Object> get props => [error];
}
