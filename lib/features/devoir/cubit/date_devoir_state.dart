part of 'date_devoir_cubit.dart';

abstract class DateDevoirState extends Equatable {
  const DateDevoirState();
}


class DateDevoirLoading extends DateDevoirState {
  const DateDevoirLoading();
  @override
  List<Object> get props => [];
}

class DateDevoirLoaded extends DateDevoirState {
  final DevoirsDatesModel model;
  const DateDevoirLoaded({required this.model});
  @override
  List<Object> get props => [];
}

class DateDevoirError extends DateDevoirState {
  final String message;
  const DateDevoirError({required this.message});
  @override
  List<Object> get props => [message];
}