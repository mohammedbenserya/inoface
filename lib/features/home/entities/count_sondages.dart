import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'count_sondages.g.dart';

class CountSondages extends Table {

  IntColumn get idSondage => integer()();
  IntColumn get id_personne => integer().nullable()();

  @override
  Set<Column> get primaryKey => {idSondage};
}

// @DriftAccessor(tables: [CountSondages])
@UseDao(tables: [CountSondages])
class CountSondagesDao extends DatabaseAccessor<AppDatabase>
    with _$CountSondagesDaoMixin {

  final AppDatabase db;
  CountSondagesDao(this.db) : super(db);

  Stream<List<CountSondage>> watchAllCountSondage() => select(countSondages).watch();
  Future<List<CountSondage>> getAllCountSondage() => select(countSondages).get();

  Future<void> insertAllCountSondage(List<Insertable<CountSondage>> rows) => batch((batch) =>
      batch.insertAll(countSondages, rows, mode: InsertMode.insertOrReplace));
  Future insertCountSondage(Insertable<CountSondage> row) => into(countSondages).insert(row, mode: InsertMode.replace);
  Future updateCountSondage(Insertable<CountSondage> row) => update(countSondages).replace(row);
  Future deleteCountSondage(Insertable<CountSondage> row) => delete(countSondages).delete(row);


  Future<List<CountSondage>> getCountSondageByIdPer({required int idPer}) {
    return (select(countSondages)
      ..where((tbl) => tbl.id_personne.equals(idPer))
    ).get();
  }

  Stream<CountSondage?> watchCountSondageByIdPerAndId({required int idPer, required int idEve}) {
    return (select(countSondages)
      ..where((tbl) => tbl.id_personne.equals(idPer) & tbl.idSondage.equals(idEve))
    ).watchSingleOrNull();
  }
}