import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'agenda_types_details.g.dart';

class AgendaTypesDetails extends Table {
  IntColumn get id_agenda_type_detail => integer()();
  TextColumn get description => text().nullable()();
  TextColumn get lien_image => text().nullable()();
  IntColumn get position => integer().nullable()();
  IntColumn get facturable => integer().nullable()();
  IntColumn get id_agenda_type => integer()();

  @override
  Set<Column> get primaryKey => {id_agenda_type_detail};
}

// @DriftAccessor(tables: [AgendaTypesDetails])
@UseDao(tables: [AgendaTypesDetails])
class AgendaTypesDetailsDao extends DatabaseAccessor<AppDatabase> with _$AgendaTypesDetailsDaoMixin {
  final AppDatabase db;
  AgendaTypesDetailsDao(this.db) : super(db);

  Stream<List<AgendaTypesDetail>> watchAllAgendaTypesDetail() => select(agendaTypesDetails).watch();
  Future<List<AgendaTypesDetail>> getAllAgendaTypesDetail() => select(agendaTypesDetails).get();

  Future<void> insertAllAgendaTypesDetail(List<Insertable<AgendaTypesDetail>> rows) =>
      batch((batch) => batch.insertAll(agendaTypesDetails, rows, mode: InsertMode.replace));
  Future insertAgendaTypesDetail(Insertable<AgendaTypesDetail> row) =>
      into(agendaTypesDetails).insert(row, mode: InsertMode.replace);
  Future updateAgendaTypesDetail(Insertable<AgendaTypesDetail> row) => update(agendaTypesDetails).replace(row);
  Future deleteAgendaTypesDetail(Insertable<AgendaTypesDetail> row) => delete(agendaTypesDetails).delete(row);

  Stream<List<AgendaTypesDetail>> watchAllAgendaTypesDetailById(int id) {
    return (select(agendaTypesDetails)..where((t) => t.id_agenda_type_detail.equals(id))).watch();
  }

  Future<AgendaTypesDetail?> getAgendaTypesDetailById(int idAgendaTypeDetail) {
    return (select(agendaTypesDetails)..where((t) => t.id_agenda_type_detail.equals(idAgendaTypeDetail)))
        .getSingleOrNull();
  }
}
