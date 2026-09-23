import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'agenda_details.g.dart';

class AgendaDetails extends Table {
  IntColumn get id_agenda_detail => integer()();
  IntColumn get id_agenda => integer().nullable()();
  IntColumn get id_agenda_type_detail => integer()();
  IntColumn get position => integer().withDefault(const Constant(0))();
  DateTimeColumn get agenda_retard => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id_agenda_detail};
}

// @DriftAccessor(tables: [AgendaDetails])
@UseDao(tables: [AgendaDetails])
class AgendaDetailsDao extends DatabaseAccessor<AppDatabase> with _$AgendaDetailsDaoMixin {
  final AppDatabase db;
  AgendaDetailsDao(this.db) : super(db);

  Stream<List<AgendaDetail>> watchAllAgendaDetail() => select(agendaDetails).watch();
  Future<List<AgendaDetail>> getAllAgendaDetail() => select(agendaDetails).get();

  Future<void> insertAllAgendaDetail(List<Insertable<AgendaDetail>> rows) =>
      batch((batch) => batch.insertAll(agendaDetails, rows, mode: InsertMode.replace));
  Future insertAgendaDetail(Insertable<AgendaDetail> row) => into(agendaDetails).insert(row, mode: InsertMode.replace);
  Future updateAgendaDetail(Insertable<AgendaDetail> row) => update(agendaDetails).replace(row);
  Future deleteAgendaDetail(Insertable<AgendaDetail> row) => delete(agendaDetails).delete(row);

  Stream<List<AgendaDetail>> watchAllAAgendaDetailById(int id) {
    return (select(agendaDetails)..where((t) => t.id_agenda_detail.equals(id))).watch();
  }

  Future<List<AgendaDetail>> getAllAgendaDetailById(int idAgenda) {
    return (select(agendaDetails)
      ..orderBy([
            (t) => OrderingTerm(expression: t.position, mode: OrderingMode.asc)
            // (t) => OrderingTerm(expression: t.position, mode: OrderingMode.asc)
      ])
      ..where((t) => t.id_agenda.equals(idAgenda))).get();
  }

  Stream<List<AgendaDetailWithAgendaTypeDetail>> watchAgendaWithAgendaTypeDetails({required int idAgenda}) {
    final query =
        "SELECT * FROM agenda_types_details join agenda_details on agenda_types_details.id_agenda_type_detail = agenda_details.id_agenda_type_detail WHERE agenda_details.id_agenda=$idAgenda;";
    return customSelect(
      query,
      readsFrom: {
        db.agendaTypesDetails,
        agendaDetails
      }, // used for the stream: the stream will update when either table changes
    ).watch().map((rows) => rows.map(
          (row) {
            return AgendaDetailWithAgendaTypeDetail(
              agendaDetail: AgendaDetail.fromJson(row.data),
              agendaTypesDetail: AgendaTypesDetail.fromJson(row.data),
            );
          },
        ).toList());
  }
}

class AgendaDetailWithAgendaTypeDetail {
  final AgendaDetail agendaDetail;
  final AgendaTypesDetail agendaTypesDetail;

  AgendaDetailWithAgendaTypeDetail({
    required this.agendaDetail,
    required this.agendaTypesDetail,
  });
}
