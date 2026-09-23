import 'package:inoface/core/usecases/enums.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../core/util/url_service.dart';
import '../../../login/models/input_login.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../models/notes_model.dart';
import 'package:get/get.dart';
import 'notes_state.dart';
import 'dart:developer';
import 'dart:convert';



class NotesLogic extends GetxController {
  final NotesState state = NotesState();


  @override
  void onInit() {
    state.isLoading = false;
    getNotes();
    super.onInit();
  }


  Future<void> getNotes() async {
    try {
      if (networkState.isConnected) {
        setStateLoad(true);
        final login = authState.inputLogin!;
        final idPersonne = utilsState.enfant!.id_personne;
        final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.controlenotes_ws)),
          body: {'inoface_ws': toJsonString(login, idPersonne)},
        );

        /// -> ControlesNotes
        if (kDebugMode) {
          log('getNotes: ${response.body}');
          // logger.i('getNotes: ${toJsonString(login)}');
        }


        if (response.statusCode == 200) {
          state.notes = notesModelFromJson(response.body);
        }

        setStateLoad(false);
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch(e) {
      logger.e(e);
      setStateLoad(false);
    }
  }

  void setStateLoad(bool val) {
    state.isLoading = val;
    update();
  }

  String toJsonString(InputLogin input, int idPersonne) {
    var body = {
      'identifiant': input.identifiant.replaceAll(' ', ''),
      'motdepasse': input.motdepasse.replaceAll(' ', ''),
      'tokenmobile': input.tokenmobile?.replaceAll(' ', ''),
      'id_personne': idPersonne,
    };
    return json.encode(body);
  }

}
