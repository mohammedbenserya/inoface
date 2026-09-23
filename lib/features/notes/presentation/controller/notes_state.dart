import '../../models/notes_model.dart';
import 'package:get/get.dart';



class NotesState {

  late bool isLoading;
  late NotesModel notes;

  NotesState() {
    isLoading = false;
    notes = NotesModel(
      controlesNotes: [],
      erreur: true,
      message: 'something_wrong'.tr,
    );
  }


}
