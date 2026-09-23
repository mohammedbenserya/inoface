import '../../../core/database/app_database.dart';


class AgendaState {

  late DateTime dateTimeLocal;
  late List<AgendaDate> events;
  AgendaState() {
    dateTimeLocal =  DateTime.now();
    events = [];
  }
}
