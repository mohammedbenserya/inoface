import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'recuperations.g.dart';

class Recuperations extends Table {

  IntColumn get id_eleve_recuperations => integer()();
  IntColumn get id_personne_parent => integer().nullable()();
  IntColumn get id_personne_eleve => integer().nullable()();
  TextColumn get parentnom => text().nullable()();
  DateTimeColumn get date_de_la_demande => dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Set<Column> get primaryKey => {id_eleve_recuperations};

}

// @DriftAccessor(tables: [Recuperations])
@UseDao(tables: [Recuperations])
class RecuperationsDao extends DatabaseAccessor<AppDatabase>
    with _$RecuperationsDaoMixin {

  final AppDatabase db;
  RecuperationsDao(this.db) : super(db);

  Stream<List<Recuperation>> watchAllRecuperation() => select(recuperations).watch();
  Future<List<Recuperation>> getAllRecuperation() => select(recuperations).get();

  Future<void> insertAllRecuperation(List<Insertable<Recuperation>> rows) => batch((batch) => batch.insertAll(recuperations, rows, mode: InsertMode.replace));
  Future insertRecuperation(Insertable<Recuperation> row) => into(recuperations).insert(row, mode: InsertMode.replace);
  Future updateRecuperation(Insertable<Recuperation> row) => update(recuperations).replace(row);
  Future deleteRecuperation(Insertable<Recuperation> row) => delete(recuperations).delete(row);

  Stream<List<Recuperation>> watchRecuperationById(int id) {
    return (select(recuperations)
      ..where((t) => t.id_eleve_recuperations.equals(id))).watch();
  }

  Future<List<Recuperation>> getRecuperationById(int id) {
    return (select(recuperations)
      ..where((t) => t.id_eleve_recuperations.equals(id))).get();
  }

  Stream<List<Recuperation>> watchRecuperationByDate() {
    return (select(recuperations)
      ..orderBy(
        ([
            (t) => OrderingTerm(expression: t.date_de_la_demande, mode: OrderingMode.desc),
        ]),
      )).watch();
  }
}