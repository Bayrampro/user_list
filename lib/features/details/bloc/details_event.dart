part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

final class LoadDetailsEvent extends DetailsEvent {
  const LoadDetailsEvent({
    required this.id,
  });

  final int id;

  @override
  List<Object> get props => [id];
}
