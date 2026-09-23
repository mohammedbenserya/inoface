import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'counters.g.dart';

class Counters extends Table {

  IntColumn get id_personne => integer()();
  IntColumn get count_jours_feries => integer()();
  IntColumn get count_evenements => integer()();
  IntColumn get count_informations => integer()();
  IntColumn get count_sondages => integer()();
  IntColumn get count_notifications => integer()();

  @override
  Set<Column> get primaryKey => {id_personne};


/*
    //! this is id_jour = json['id_jour'];
  //! value of this field is come from json['id_jour'];
  IntColumn get id_jour_emploitemps => integer()();

  //! this random id
  IntColumn get id_jour => integer()();
  IntColumn get id_personne_eleve => integer()();
  TextColumn get Jour => text().nullable()();
   */

}

// @DriftAccessor(tables: [Counters])
@UseDao(tables: [Counters])
class CountersDao extends DatabaseAccessor<AppDatabase>
    with _$CountersDaoMixin {

  final AppDatabase db;
  CountersDao(this.db) : super(db);

  Stream<List<Counter>> watchAllCounter() => select(counters).watch();
  Future<List<Counter>> getAllCounter() => select(counters).get();

  Future<void> insertAllCounter(List<Insertable<Counter>> rows) => batch((batch) => batch.insertAll(counters, rows, mode: InsertMode.replace));
  Future<int> insertCounter(Insertable<Counter> row) => into(counters).insert(row, mode: InsertMode.replace);
  Future<bool> updateCounter(Insertable<Counter> row) => update(counters).replace(row);
  Future<int> deleteCounter(Insertable<Counter> row) => delete(counters).delete(row);

  Future<Counter?> getCounterByIdPersonne(int idPersonn) {
    return (select(counters)
      ..where((tbl) => tbl.id_personne.equals(idPersonn))
    ).getSingleOrNull();
  }

  Future<List<Counter>> getAllCounterByIdPersonne(int idPersonn) {
    return (select(counters)
      ..where((tbl) => tbl.id_personne.equals(idPersonn))
    ).get();
  }

}