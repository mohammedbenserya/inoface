import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'seances.g.dart';

class Seances extends Table {

  IntColumn get id => integer().autoIncrement()();
  IntColumn get id_jour => integer().nullable()();
  IntColumn get id_personne_eleve => integer().nullable()();
  TextColumn get horaire_debut => text().nullable()();
  TextColumn get horaire_fin => text().nullable()();
  TextColumn get horaire_tranches_type => text().nullable()();
  TextColumn get matiere => text().nullable()();
  TextColumn get salle => text().nullable()();

  // @override
  // Set<Column> get primaryKey => {id_jour};

}

// @DriftAccessor(tables: [Seances])
@UseDao(tables: [Seances])
class SeancesDao extends DatabaseAccessor<AppDatabase>
    with _$SeancesDaoMixin {

  final AppDatabase db;
  SeancesDao(this.db) : super(db);

  Stream<List<Seance>> watchAllSeance() => select(seances).watch();
  Future<List<Seance>> getAllSeance() => select(seances).get();

  Future<void> insertAllSeance(List<Insertable<Seance>> rows) => batch((batch) =>
      batch.insertAll(seances, rows, mode: InsertMode.replace));
  Future insertSeance(Insertable<Seance> row) => into(seances).insert(row, mode: InsertMode.replace);
  Future updateSeance(Insertable<Seance> row) => update(seances).replace(row);
  Future deleteSeance(Insertable<Seance> row) => delete(seances).delete(row);

  Future<List<Seance>> getSeanceById(int id_jour, int id_personne_eleve) {
    return (select(seances)
      ..orderBy([
            (t) => OrderingTerm(expression: t.horaire_debut, mode: OrderingMode.asc)
      ])..where((tbl) => tbl.id_jour.equals(id_jour) & tbl.id_personne_eleve.equals(id_personne_eleve))
    ).get();
  }
}