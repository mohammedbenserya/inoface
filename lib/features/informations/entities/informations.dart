import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'informations.g.dart';

class Informations extends Table {

  IntColumn get id_information => integer()();
  IntColumn get id_personne => integer()();
  TextColumn get titre => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get debut => dateTime()();
  DateTimeColumn get fin => dateTime()();
  TextColumn get lastupdate => text ()();
  //DateTimeColumn get lastupdate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id_information};

}


// @DriftAccessor(tables: [Informations])
@UseDao(tables: [Informations])
class InformationsDao extends DatabaseAccessor<AppDatabase>
    with _$InformationsDaoMixin {

  final AppDatabase db;
  InformationsDao(this.db) : super(db);

  //Stream<List<Evenement>> watchAllEvenement() => select(evenements).watch();
  Future<List<Information>> getAllInformation() => select(informations).get();

  Future<void> insertAllInformation(List<Insertable<Information>> rows) => batch((batch) => batch.insertAll(informations, rows, mode: InsertMode.replace));
  Future<int> insertInformation(Insertable<Information> row) => into(informations).insert(row, mode: InsertMode.replace);
  Future<bool> updateInformation(Insertable<Information> row) => update(informations).replace(row);
  Future<int> deleteInformation(Insertable<Information> row) => delete(informations).delete(row);

  Stream<List<Information>> watchAllInformationByIdPer(int idPer) {
    return (select(informations)
      ..orderBy(
        ([
            (t) => OrderingTerm(expression: t.debut, mode: OrderingMode.desc),
        ]),
      )..where((tbl) => tbl.id_personne.equals(idPer))
    ).watch();
  }

  Future<List<Information>> getAllInformationByIdPer(int idPer) {
    return (select(informations)
      ..where((tbl) => tbl.id_personne.equals(idPer))
    ).get();
  }

  Future<Information?> getInformationByIdEveAndIdPer({required int idInfo, required int idPer}) {
    return (select(informations)
      ..where((tbl) => tbl.id_information.equals(idInfo) & tbl.id_personne.equals(idPer))
    ).getSingleOrNull();
  }

  Future<int> deleteAllByIdPersonne({required int id}) {
    return (delete(informations)
      ..where((tbl) => tbl.id_personne.equals(id))
    ).go();
  }
}