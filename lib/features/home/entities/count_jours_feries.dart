import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'count_jours_feries.g.dart';

class CountJoursFeries extends Table {


  IntColumn get idJoursFeries => integer()();
  IntColumn get id_personne => integer().nullable()();

  @override
  Set<Column> get primaryKey => {idJoursFeries};
}

// @DriftAccessor(tables: [CountJoursFeries])
@UseDao(tables: [CountJoursFeries])
class CountJoursFeriesDao extends DatabaseAccessor<AppDatabase>
    with _$CountJoursFeriesDaoMixin {

  final AppDatabase db;
  CountJoursFeriesDao(this.db) : super(db);

  Stream<List<CountJoursFerie>> watchAllCountJoursFerie() => select(countJoursFeries).watch();
  Future<List<CountJoursFerie>> getAllCountJoursFerie() => select(countJoursFeries).get();

  Future<void> insertAllCountJoursFerie(List<Insertable<CountJoursFerie>> rows) => batch((batch) =>
      batch.insertAll(countJoursFeries, rows, mode: InsertMode.insertOrReplace));
  Future<int> insertCountJoursFerie(Insertable<CountJoursFerie> row) => into(countJoursFeries).insert(row, mode: InsertMode.replace);
  Future<bool> updateCountJoursFerie(Insertable<CountJoursFerie> row) => update(countJoursFeries).replace(row);
  Future<int> deleteCountJoursFerie(Insertable<CountJoursFerie> row) => delete(countJoursFeries).delete(row);

  Future<List<CountJoursFerie>> getCountJoursFerieByIdPer({required int idPer}) {
    return (select(countJoursFeries)
      ..where((tbl) => tbl.id_personne.equals(idPer))
    ).get();
  }

  Future<List<CountJoursFerie>> getCountJoursFerieById({required int id}) {
    return (select(countJoursFeries)
      ..where((tbl) => tbl.idJoursFeries.equals(id))
    ).get();
  }

}