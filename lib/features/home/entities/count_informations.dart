import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'count_informations.g.dart';

class CountInformations extends Table {


  IntColumn get idInformation => integer()();
  IntColumn get id_personne => integer().nullable()();

  @override
  Set<Column> get primaryKey => {idInformation};
}

// @DriftAccessor(tables: [CountInformations])
@UseDao(tables: [CountInformations])
class CountInformationsDao extends DatabaseAccessor<AppDatabase>
    with _$CountInformationsDaoMixin {

  final AppDatabase db;
  CountInformationsDao(this.db) : super(db);

  Stream<List<CountInformation>> watchAllCountInformation() => select(countInformations).watch();
  Future<List<CountInformation>> getAllCountInformation() => select(countInformations).get();

  Future<void> insertAllCountInformation(List<Insertable<CountInformation>> rows) => batch((batch) =>
      batch.insertAll(countInformations, rows, mode: InsertMode.insertOrReplace));
  Future<int> insertCountInformation(Insertable<CountInformation> row) => into(countInformations).insert(row, mode: InsertMode.replace);
  Future<bool> updateCountInformation(Insertable<CountInformation> row) => update(countInformations).replace(row);
  Future<int> deleteCountInformation(Insertable<CountInformation> row) => delete(countInformations).delete(row);

  Future<List<CountInformation>> getCountInformationByIdPer({required int idPer}) {
    return (select(countInformations)
      ..where((tbl) => tbl.id_personne.equals(idPer))).get();
  }

  Stream<CountInformation?> watchCountInformationIdPerAndId({required int idPer, required int idInfo}) {
    return (select(countInformations)
      ..where((tbl) => tbl.id_personne.equals(idPer) & tbl.idInformation.equals(idInfo))
    ).watchSingleOrNull();
  }

  Stream<CountInformation?> watchCountInformationId({required int idInfo}) {
    return (select(countInformations)
      ..where((tbl) => tbl.idInformation.equals(idInfo))
    ).watchSingleOrNull();
  }

  /*
  // select count (*) from tabInfo where idInfo in (select idInfo from tabAPIsInfon where idPers ==:$id)
  Future<List<CountInformation>> getFilteredCount({required int idPer}) async {
    final schemaQuery = await customSelect(
      'SELECT count (*) from countInformations WHERE idInformation in (SELECT idInformation from counters WHERE id_personne = ?);',
      variables: [
        Variable<int>(idPer),
      ],
      readsFrom: {db.countInformations, db.counters},
    ).get();
    final list = <CountInformation>[];

    for (final row in schemaQuery) {
      list.add(CountInformation.fromJson(row.data));
    }

    return list;

    // searchString = 'the';
    // return customSelect(
    //   //query works fine
    //   //'SELECT * FROM books;',
    //   'SELECT * FROM books WHERE title LIKE ?;',
    //   variables: [
    //     Variable.withString(searchString),
    //   ],
    //   readsFrom: {countInformations, db.counters},
    // ).get();
  }
  */


}