part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent {
  final InputLogin login;
  const Login({required this.login});

  @override
  List<Object> get props => [login];
}

class LoginQRCode extends LoginEvent {
  final InputQrcode inputQrcode;
  const LoginQRCode(this.inputQrcode);
  @override
  List<Object> get props => [inputQrcode];
}