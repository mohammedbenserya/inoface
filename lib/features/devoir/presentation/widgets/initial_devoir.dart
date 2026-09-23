// import 'package:inoface/features/devoir/presentation/bloc/devoir_bloc.dart';
// import 'package:inoface/features/devoir/domain/usecases/input_devoir.dart';
// import 'package:inoface/core/usecases/constants.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
//
//
// class InitialDevoir extends StatelessWidget {
//
//   final String? date;
//   final int idPersonne;
//   const InitialDevoir({Key? key,
//   required this.idPersonne,
//   this.date,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: FutureBuilder<InputDevoir>(
//         future: utilsLogic.getInputDevoir(idPersonne, date!),
//         builder: (context, snapshot) {
//           switch(snapshot.connectionState) {
//             case ConnectionState.waiting: return const Center(
//               child: CircularProgressIndicator(),
//             );
//             default:
//               context.read<DevoirBloc>().add(DevoirWs(input: snapshot.data!));
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//           }
//         },
//       ),
//     );
//   }
// }
