import 'package:dartz/dartz.dart';
import '../../../core/usecases/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../models/input_survey.dart';
import '../models/survey_model.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'survey_state.dart';

@injectable
class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit() : super(const SurveyInitial());

  Future<void> getSurvey({required int idPersonne}) async {
    try {
      InputSurvey? input = surveyLogic.getInputSurvey(idPersonne: idPersonne);
      if (input != null) {
        Either<Failure, SurveyModel> either = await surveyLogic.getSurvey(input);
        either.fold((failure) {
          String? msg;
          if (failure.props.isNotEmpty) {
            msg = failure.props.elementAt(0).toString();
          } else {
            msg = 'error_wrong'.tr;
          }
          logger.e('messageFailure: $msg');
          emit(SurveyError(message: msg));
        }, (values) async {
          emit(SurveyLoaded(model: values));
        });
      } else {
        emit(SurveyError(message: 'no_data_failure'.tr));
      }
    } catch(e) {
      emit(SurveyError(message: e.toString()));
    }
  }

}
