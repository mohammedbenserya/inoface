import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'agenda_types.g.dart';

class AgendaTypes extends Table {
  IntColumn get id_agenda_type => integer()();
  TextColumn get description => text().nullable()();
  TextColumn get lien_image => text().nullable()();
  TextColumn get agenda_journee_type_description => text().nullable()();
  IntColumn get id_agenda_types_prestation => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id_agenda_type};
}

// @DriftAccessor(tables: [AgendaTypes])
@UseDao(tables: [AgendaTypes])
class AgendaTypesDao extends DatabaseAccessor<AppDatabase> with _$AgendaTypesDaoMixin {
  final AppDatabase db;
  AgendaTypesDao(this.db) : super(db);

  Stream<List<AgendaType>> watchAllAgendaType() => select(agendaTypes).watch();
  Future<List<AgendaType>> getAllAgendaType() => select(agendaTypes).get();

  Future<void> insertAllAgendaType(List<Insertable<AgendaType>> rows) =>
      batch((batch) => batch.insertAll(agendaTypes, rows, mode: InsertMode.replace));
  Future insertAgendaType(Insertable<AgendaType> row) => into(agendaTypes).insert(row, mode: InsertMode.replace);
  Future updateAgendaType(Insertable<AgendaType> row) => update(agendaTypes).replace(row);
  Future deleteAgendaType(Insertable<AgendaType> row) => delete(agendaTypes).delete(row);

  Stream<List<AgendaType>> watchAllAgendaTypeById(int id) {
    return (select(agendaTypes)..where((t) => t.id_agenda_type.equals(id))).watch();
  }

  Future<List<AgendaType>> getAllAgendaTypesById(int id) {
    return (select(agendaTypes)..where((t) => t.id_agenda_type.equals(id))).get();
  }

  Future<AgendaType?> getAgendaTypesById(int id) {
    return (select(agendaTypes)..where((t) => t.id_agenda_type.equals(id))).getSingleOrNull();
  }
}
