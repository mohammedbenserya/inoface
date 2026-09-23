import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'count_evenements.g.dart';

class CountEvenements extends Table {


  IntColumn get idEvenement => integer()();
  IntColumn get id_personne => integer().nullable()();


  @override
  Set<Column> get primaryKey => {idEvenement};
}

// @DriftAccessor(tables: [CountEvenements])
@UseDao(tables: [CountEvenements])
class CountEvenementsDao extends DatabaseAccessor<AppDatabase>
    with _$CountEvenementsDaoMixin {

  final AppDatabase db;
  CountEvenementsDao(this.db) : super(db);

  Stream<List<CountEvenement>> watchAllCountEvenement() => select(countEvenements).watch();
  Future<List<CountEvenement>> getAllCountEvenement() => select(countEvenements).get();

  Future<void> insertAllCountEvenement(List<Insertable<CountEvenement>> rows) => batch((batch) =>
      batch.insertAll(countEvenements, rows, mode: InsertMode.insertOrReplace));
  Future insertCountEvenement(Insertable<CountEvenement> row) => into(countEvenements).insert(row, mode: InsertMode.replace);
  Future updateCountEvenement(Insertable<CountEvenement> row) => update(countEvenements).replace(row);
  Future deleteCountEvenement(Insertable<CountEvenement> row) => delete(countEvenements).delete(row);

  // Future<CountEvenement> getCountEvenementInfo({int idPer, int idInfo}) {
  //   return (select(CountEvenements)
  //     ..where((tbl) => tbl.id_personne.equals(idPer) & tbl.idInfo.equals(idInfo))
  //   ).getSingleOrNull();
  // }
  //
  // Future<CountEvenement> getCountEvenementEvent({int idPer, int idEvent}) {
  //   return (select(CountEvenements)
  //     ..where((tbl) => tbl.id_personne.equals(idPer) & tbl.idEvent.equals(idEvent))
  //   ).getSingleOrNull();
  // }
  //
  Future<List<CountEvenement>> getCountEvenementByIdPer({required int idPer}) {
    return (select(countEvenements)
      ..where((tbl) => tbl.id_personne.equals(idPer))
    ).get();
  }

  Stream<CountEvenement?> watchCountEvenementByIdPerAndId({required int idPer, required int idEve}) {
    return (select(countEvenements)
      ..where((tbl) => tbl.id_personne.equals(idPer) & tbl.idEvenement.equals(idEve))
    ).watchSingleOrNull();
  }

  Stream<CountEvenement?> watchCountEvenementById({required int idEve}) {
    return (select(countEvenements)
      ..where((tbl) => tbl.idEvenement.equals(idEve))
    ).watchSingleOrNull();
  }

}