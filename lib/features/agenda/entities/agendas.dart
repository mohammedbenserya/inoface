import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'agendas.g.dart';

class Agendas extends Table {
  IntColumn get id_agenda => integer()();
  DateTimeColumn get date_agenda => dateTime()();
  TextColumn get agenda_journee_type_description => text().nullable()();
  IntColumn get id_personne => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id_agenda};
}

// @DriftAccessor(tables: [Agendas])
@UseDao(tables: [Agendas])
class AgendasDao extends DatabaseAccessor<AppDatabase> with _$AgendasDaoMixin {
  final AppDatabase db;
  AgendasDao(this.db) : super(db);

  Stream<List<Agenda>> watchAllAgenda() => select(agendas).watch();
  Future<List<Agenda>> getAllAgenda() => select(agendas).get();

  Future<void> insertAllAgenda(List<Insertable<Agenda>> rows) =>
      batch((batch) => batch.insertAll(agendas, rows, mode: InsertMode.replace));
  Future insertAgenda(Insertable<Agenda> row) => into(agendas).insert(row, mode: InsertMode.replace);
  Future updateAgenda(Insertable<Agenda> row) => update(agendas).replace(row);
  Future deleteAgenda(Insertable<Agenda> row) => delete(agendas).delete(row);

  Stream<List<Agenda>> watchAllAgendaByDate(DateTime dateTime) {
    return (select(agendas)..where((t) => t.date_agenda.equals(dateTime))).watch();
  }

  Future<List<Agenda>> getAllAgendasById(int id) {
    return (select(agendas)..where((t) => t.id_agenda.equals(id))).get();
  }

  Future<Agenda?> getAgendasByIdAgendaAndIdPer({required int idAgenda, required int idPer}) {
    return (select(agendas)..where((t) => t.id_agenda.equals(idAgenda) & t.id_personne.equals(idPer)))
        .getSingleOrNull();
  }

  Future<List<Agenda>> getAllAgendasByDate(DateTime date) {
    return (select(agendas)
          ..orderBy([(t) => OrderingTerm(expression: t.agenda_journee_type_description, mode: OrderingMode.desc)])
          ..where((t) => t.date_agenda.equals(date)))
        .get();

    /*
    return (select(agendas)
      ..where((t) => t.date_agenda.year.equals(date.year) &
      t.date_agenda.month.equals(date.month) &
      t.date_agenda.day.equals(date.day)
      )).get();
     */
  }

  Future<List<Agenda>> getAllAgendasByDateAndIdPerson(DateTime date, int idPerson) {
    return (select(agendas)
          ..orderBy([(t) => OrderingTerm(expression: t.agenda_journee_type_description, mode: OrderingMode.desc)])
          ..where((t) => t.date_agenda.equals(date) & t.id_personne.equals(idPerson)))
        .get();

    /*
    return (select(agendas)
      ..where((t) => t.date_agenda.year.equals(date.year) &
      t.date_agenda.month.equals(date.month) &
      t.date_agenda.day.equals(date.day)
      )).get();
     */
  }

  Stream<List<Agenda>> watchAllAgendasByDate(DateTime date) {
    return (select(agendas)..where((t) => t.date_agenda.equals(date))).watch();
  }
}
