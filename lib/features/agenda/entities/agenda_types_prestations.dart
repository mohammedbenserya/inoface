import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'agenda_types_prestations.g.dart';

class AgendaTypesPrestations extends Table {

  IntColumn get id_agenda_types_prestation => integer()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id_agenda_types_prestation};

}

// @DriftAccessor(tables: [AgendaTypesPrestations])
@UseDao(tables: [AgendaTypesPrestations])
class AgendaTypesPrestationsDao extends DatabaseAccessor<AppDatabase>
    with _$AgendaTypesPrestationsDaoMixin {

  final AppDatabase db;
  AgendaTypesPrestationsDao(this.db) : super(db);

  Stream<List<AgendaTypesPrestation>> watchAllAgendaTypesPrestation() => select(agendaTypesPrestations).watch();
  Future<List<AgendaTypesPrestation>> getAllAgendaTypesPrestation() => select(agendaTypesPrestations).get();

  Future<void> insertAllAgendaTypesPrestation(List<Insertable<AgendaTypesPrestation>> rows) => batch((batch) => batch.insertAll(agendaTypesPrestations, rows, mode: InsertMode.replace));
  Future insertAgendaTypesPrestation(Insertable<AgendaTypesPrestation> row) => into(agendaTypesPrestations).insert(row, mode: InsertMode.replace);
  Future updateAgendaTypesPrestation(Insertable<AgendaTypesPrestation> row) => update(agendaTypesPrestations).replace(row);
  Future deleteAgendaTypesPrestation(Insertable<AgendaTypesPrestation> row) => delete(agendaTypesPrestations).delete(row);

  Stream<List<AgendaTypesPrestation>> watchAllAgendaTypesPrestationById(int id) {
    return (select(agendaTypesPrestations)
      ..where((t) => t.id_agenda_types_prestation.equals(id))).watch();
  }

  Future<List<AgendaTypesPrestation>> getAllAgendaTypesPrestationById(int id) {
    return (select(agendaTypesPrestations)
      ..where((t) => t.id_agenda_types_prestation.equals(id))).get();
  }
}