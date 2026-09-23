import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'agenda_photo_details.g.dart';

class AgendaPhotoDetails extends Table {

  IntColumn get id_agenda_photo_detail => integer()();
  TextColumn get nom_original_photo => text().nullable()();
  TextColumn get lieu_photo => text().nullable()();
  IntColumn get position => integer().nullable()();
  IntColumn get id_agenda => integer().nullable()();
  IntColumn get id_personne => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id_agenda_photo_detail};

}

// @DriftAccessor(tables: [AgendaPhotoDetails])
@UseDao(tables: [AgendaPhotoDetails])
class AgendaPhotoDetailsDao extends DatabaseAccessor<AppDatabase>
    with _$AgendaPhotoDetailsDaoMixin {

  final AppDatabase db;
  AgendaPhotoDetailsDao(this.db) : super(db);

  Stream<List<AgendaPhotoDetail>> watchAllAgendaPhotoDetail() => select(agendaPhotoDetails).watch();
  Future<List<AgendaPhotoDetail>> getAllAgendaPhotoDetail() => select(agendaPhotoDetails).get();

  Future<void> insertAllAgendaPhotoDetail(List<Insertable<AgendaPhotoDetail>> rows) =>
      batch((batch) => batch.insertAll(agendaPhotoDetails, rows, mode: InsertMode.replace));
  Future insertAgendaPhotoDetail(Insertable<AgendaPhotoDetail> row) => into(agendaPhotoDetails).insert(row, mode: InsertMode.replace);
  Future updateAgendaPhotoDetail(Insertable<AgendaPhotoDetail> row) => update(agendaPhotoDetails).replace(row);
  Future deleteAgendaPhotoDetail(Insertable<AgendaPhotoDetail> row) => delete(agendaPhotoDetails).delete(row);

  Stream<List<AgendaPhotoDetail>> watchAllAgendaPhotoDetailById(int id) {
    return (select(agendaPhotoDetails)
      ..where((t) => t.id_agenda_photo_detail.equals(id))).watch();
  }

  Future<List<AgendaPhotoDetail>> getAllAgendaPhotoDetailByIdPers(int idPersonne) {
    return (select(agendaPhotoDetails)
      // ..orderBy([
      //       (t) => OrderingTerm(expression: t.position, mode: OrderingMode.asc)
      // ])
      ..where((t) => t.id_personne.equals(idPersonne))).get();
  }

  Future<List<AgendaPhotoDetail>> getAllAgendaPhotoDetailById(int idAgenda) {
    return (select(agendaPhotoDetails)
    ..orderBy([
          (t) => OrderingTerm(expression: t.position, mode: OrderingMode.asc)
    ])..where((t) => t.id_agenda.equals(idAgenda))).get();
  }
}