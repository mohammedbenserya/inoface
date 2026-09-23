import 'package:inoface/core/database/app_database.dart';
import 'package:moor/moor.dart';
// import 'package:drift/drift.dart';

part 'agenda_notes.g.dart';

class AgendaNotes extends Table {

  IntColumn get id_agenda_note => integer()();
  TextColumn get note => text()();
  DateTimeColumn get date_agenda_note => dateTime().nullable()();
  IntColumn get id_agenda => integer()();
  BoolColumn get send => boolean().nullable().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id_agenda_note};

}

// @DriftAccessor(tables: [AgendaNotes])
@UseDao(tables: [AgendaNotes])
class AgendaNotesDao extends DatabaseAccessor<AppDatabase>
    with _$AgendaNotesDaoMixin {

  final AppDatabase db;
  AgendaNotesDao(this.db) : super(db);

  Stream<List<AgendaNote>> watchAllAgendaNote() => select(agendaNotes).watch();
  Future<List<AgendaNote>> getAllAgendaNote() => select(agendaNotes).get();

  Future<void> insertAllAgendaNote(List<Insertable<AgendaNote>> rows) =>
      batch((batch) => batch.insertAll(agendaNotes, rows, mode: InsertMode.replace));
  Future insertAgendaNote(Insertable<AgendaNote> row) => into(agendaNotes).insert(row, mode: InsertMode.replace);
  Future updateAgendaNote(Insertable<AgendaNote> row) => update(agendaNotes).replace(row);
  Future deleteAgendaNote(Insertable<AgendaNote> row) => delete(agendaNotes).delete(row);

  Stream<List<AgendaNote>> watchAllAgendaNoteById(int id) {
    return (select(agendaNotes)
    ..orderBy([
        (t) => OrderingTerm(expression: t.date_agenda_note, mode: OrderingMode.desc)
    ])..where((t) => t.id_agenda.equals(id))).watch();
  }

  Future<List<AgendaNote>> getAllAgendaNoteById(int id) {
    return (select(agendaNotes)
      ..orderBy([
        (t) => OrderingTerm(expression: t.date_agenda_note, mode: OrderingMode.desc)
    ])..where((t) => t.id_agenda.equals(id))).get();
  }

  Future<void> deleteAgendaNoteById(int idAgendNote) {
    return (delete(agendaNotes)
      ..where((t) => t.id_agenda_note.equals(idAgendNote))).go();
  }

  Future<List<AgendaNote>> getAgendaNoteBySend(bool send) {
    return (select(agendaNotes)
      ..orderBy([
        (t) => OrderingTerm(expression: t.date_agenda_note, mode: OrderingMode.asc)
      ])..where((t) => t.send.equals(send))).get();
  }

  Future<List<AgendaNote>> getAgendaNoteByDate(DateTime date) {
    return (select(agendaNotes)
      ..where((t) => t.date_agenda_note.day.equals(date.day))).get();
  }
}