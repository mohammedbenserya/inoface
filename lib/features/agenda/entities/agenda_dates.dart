import 'package:inoface/core/database/app_database.dart';
import 'package:moor/moor.dart';
// import 'package:drift/drift.dart';

part 'agenda_dates.g.dart';

class AgendaDates extends Table {

  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date_agenda => dateTime().nullable()();
  BoolColumn get has_photo => boolean().withDefault(const Constant(false))();
  IntColumn get nbr_photo => integer().withDefault(const Constant(0))();

}

// @DriftAccessor(tables: [AgendaDates])
@UseDao(tables: [AgendaDates])
class AgendaDatesDao extends DatabaseAccessor<AppDatabase>
    with _$AgendaDatesDaoMixin {

  final AppDatabase db;
  AgendaDatesDao(this.db) : super(db);

  Stream<List<AgendaDate>> watchAllAgendaDate() => select(agendaDates).watch();
  Future<List<AgendaDate>> getAllAgendaDate() => select(agendaDates).get();

  Future<void> insertAllAgendaDate(List<Insertable<AgendaDate>> rows) =>
      batch((batch) => batch.insertAll(agendaDates, rows, mode: InsertMode.replace));
  Future insertAgendaDate(Insertable<AgendaDate> row) => into(agendaDates).insert(row, mode: InsertMode.replace);
  Future updateAgendaDate(Insertable<AgendaDate> row) => update(agendaDates).replace(row);
  Future deleteAgendaDate(Insertable<AgendaDate> row) => delete(agendaDates).delete(row);

  Stream<List<AgendaDate>> watchAllAgendaDateById(int id) {
    return (select(agendaDates)
      ..where((t) => t.id.equals(id))).watch();
  }

  Future<List<AgendaDate>> getAllAgendaDateById(int idAgenda) {
    return (select(agendaDates)
      ..where((t) => t.id.equals(idAgenda))).get();
  }
}
