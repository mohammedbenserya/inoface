import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/error/failures.dart';
import '../../../core/models/enfants_model.dart';
import '../../../core/usecases/enums.dart';
import '../../login/models/input_login.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'init_home_event.dart';
part 'init_home_state.dart';


@injectable
class InitHomeBloc extends Bloc<InitHomeEvent, InitHomeState> {

  InitHomeBloc() : super(const InitHomeState()) {
    on<InitHomeEvent>((event, emit) async {
      if (event is Inoface) {
        try {
          emit(state.copyWith(requestState: RequestState.loading));
          Either<Failure, EnfantsModel> either = await utilsLogic.getInit(event.login);
          return either.fold(
                (l) => emit(state.copyWith(requestState: l.state, message: l.message)),
              (r) => emit(state.copyWith(requestState: RequestState.loaded, message: 'successful'.tr, result: r)),
          );
        } catch (e) {
          return emit(state.copyWith(
            requestState: RequestState.error,
            message: '$e',
          ));
        }
      }
    });
  }
}
