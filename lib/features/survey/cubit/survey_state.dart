part of 'survey_cubit.dart';

abstract class SurveyState extends Equatable {
  const SurveyState();
}

class SurveyInitial extends SurveyState {
  const SurveyInitial();
  @override
  List<Object> get props => [];
}


class SurveyLoaded extends SurveyState {
  final SurveyModel model;
  const SurveyLoaded({required this.model});
  @override
  List<Object> get props => [model];
}

class SurveyError extends SurveyState {
  final String? message;
  const SurveyError({this.message});
  @override
  List<Object?> get props => [message];
}