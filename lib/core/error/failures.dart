import 'package:equatable/equatable.dart';
import '../usecases/enums.dart';


abstract class Failure extends Equatable {
  final String message;
  final RequestState state;
  const Failure({
    required this.message,
    required this.state
  });

  @override
  List<Object> get props => [message, state];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required String message,
    required RequestState state,
  }) : super(message: message, state: state);
}

class CacheFailure extends Failure {
  const CacheFailure({
    required String message,
    required RequestState state,
  }) : super(message: message, state: state);
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    required String message,
    required RequestState state,
  }) : super(message: message, state: state);
}

class NoDataFailure extends Failure {
  const NoDataFailure({
    required String message,
    required RequestState state,
  }) : super(message: message, state: state);
}

// abstract class Failure extends Equatable {
//   final String message;
//   final RequestState state;
//   const Failure({
//     required this.message,
//     required this.state
//   });
//
//   @override
//   List<Object> get props => [message, state];
// }
//
// class ServerFailure extends Failure {
//   const ServerFailure({
//     required String message,
//     required RequestState state,
//   }) : super(message: message, state: state);
// }
//
// class CacheFailure extends Failure {
//   const CacheFailure({
//     required String message,
//     required RequestState state,
//   }) : super(message: message, state: state);
// }
//
// class NetworkFailure extends Failure {
//   const NetworkFailure({
//     required String message,
//     required RequestState state,
//   }) : super(message: message, state: state);
// }
//
// class NoDataFailure extends Failure {
//   const NoDataFailure({
//     required String message,
//     required RequestState state,
//   }) : super(message: message, state: state);
// }
//
// /*
// abstract class Failure extends Equatable {
//   const Failure([List properties = const <dynamic>[]]) : super();
// }
//
// class ServerFailure extends Failure {
//   final String? message;
//   const ServerFailure({this.message});
//
//   @override
//   List<Object?> get props => [message];
// }
//
// class CacheFailure extends Failure {
//   final String? message;
//
//   const CacheFailure({this.message});
//
//   @override
//   List<Object?> get props => [message];
// }
//
// class NetworkFailure extends Failure {
//   final String? message;
//   const NetworkFailure({this.message});
//
//   @override
//   List<Object?> get props => [message];
// }
//
// class NoDataFailure extends Failure {
//   final String? message;
//   const NoDataFailure({this.message});
//
//   @override
//   List<Object?> get props => [message];
// }
// */