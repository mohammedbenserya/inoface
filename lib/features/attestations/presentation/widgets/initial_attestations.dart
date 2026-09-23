// import 'package:inoface/features/attestations/bloc/attestations_bloc.dart';
// import 'package:inoface/core/usecases/constants.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../widget_helper/error_app.dart';
// import '../../models/input_attestation.dart';
// import 'package:flutter/material.dart';
//
//
//
// class InitialAttestations extends StatelessWidget {
//   final int idPersonne;
//   const InitialAttestations({
//     Key? key, required this.idPersonne,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<InputAttestation>(
//       future: attestationsLogic.getInputAttestation(idPersonne),
//       builder: (context, snapshot) {
//         switch(snapshot.connectionState) {
//           case ConnectionState.waiting: return const Center(
//             child: CircularProgressIndicator(),
//           );
//           default:
//             if (snapshot.hasData) {
//               BlocProvider.of<AttestationsBloc>(context)
//                 .add(CurrentDemandeAttestations(input: snapshot.data!),
//                 );
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               return const ErrorApp();
//             }
//         }
//       },
//     );
//   }
// }
