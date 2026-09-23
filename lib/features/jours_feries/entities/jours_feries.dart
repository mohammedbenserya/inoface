import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'jours_feries.g.dart';

class JoursFeries extends Table {

  IntColumn get id_jours_feries => integer()();
  TextColumn get description_jour_ferie => text().nullable()();
  DateTimeColumn get date_debut_jour_ferie => dateTime().nullable()();
  DateTimeColumn get date_fin_jour_ferie => dateTime().nullable()();
  DateTimeColumn get lastupdate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id_jours_feries};

}

// @DriftAccessor(tables: [JoursFeries])
@UseDao(tables: [JoursFeries])
class JoursFeriesDao extends DatabaseAccessor<AppDatabase>
    with _$JoursFeriesDaoMixin {

  final AppDatabase db;
  JoursFeriesDao(this.db) : super(db);

  Stream<List<JoursFerie>> watchAllJoursFerie() => select(joursFeries).watch();
  Future<List<JoursFerie>> getAllJoursFerie() => select(joursFeries).get();

  Future<void> insertAllJoursFerie(List<Insertable<JoursFerie>> rows) => batch((batch) => batch.insertAll(joursFeries, rows, mode: InsertMode.replace));
  Future insertJoursFerie(Insertable<JoursFerie> row) => into(joursFeries).insert(row, mode: InsertMode.replace);
  Future updateJoursFerie(Insertable<JoursFerie> row) => update(joursFeries).replace(row);
  Future deleteJoursFerie(Insertable<JoursFerie> row) => delete(joursFeries).delete(row);
}