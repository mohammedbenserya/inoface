import 'package:inoface/core/usecases/constants.dart';
import '../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import '../entities/login_entity.dart';
import '../models/input_qrcode.dart';
import '../models/input_login.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(const InitialLoginState()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        try {
          /// Email and Pass
          emit(const LoadingLoginState());
          Either<Failure, LoginEntity> either = await authLogic.getAuth(event.login);
          either.fold((failure) async {
            String? msg;
            if (failure.props.isNotEmpty) {
              msg = failure.props.elementAt(0).toString();
            } else {
              msg = 'error_wrong'.tr;
            }
            emit(ErrorLoginState(message: msg));
          }, (values) async {
            logger.d('values: $values');
            emit(LoadedLoginState(entity: values));
          });
        } catch(e) {
          emit(ErrorLoginState(message: e.toString()));
        }
      } else if (event is LoginQRCode) {
        /// QRCode
        try {
          emit(const LoadingLoginState());
          Either<Failure, LoginEntity> either = await authLogic.getAuthQrCode(event.inputQrcode);
          either.fold((failure) async {
            String? msg;
            if (failure.props.isNotEmpty) {
              msg = failure.props.elementAt(0).toString();
            } else {
              msg = 'error_wrong'.tr;
            }
            emit(ErrorLoginState(message: msg));
          }, (values) async {
            emit(LoadedLoginState(entity: values));
          });
        } catch(e) {
          emit(ErrorLoginState(message: e.toString()));
        }
      }
    });
  }
}
