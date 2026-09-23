import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'evenements.g.dart';

class Evenements extends Table {

  IntColumn get id_evenement => integer()();
  IntColumn get id_personne => integer()();
  TextColumn get titre => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get debut => dateTime()();
  DateTimeColumn get fin => dateTime()();
  DateTimeColumn get lastupdate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id_evenement};

}

// @DriftAccessor(tables: [Evenements])
@UseDao(tables: [Evenements])
class EvenementsDao extends DatabaseAccessor<AppDatabase>
    with _$EvenementsDaoMixin {

  final AppDatabase db;
  EvenementsDao(this.db) : super(db);

  Stream<List<Evenement>> watchAllEvenement() => select(evenements).watch();
  Future<List<Evenement>> getAllEvenement() => select(evenements).get();

  Future<void> insertAllEvenement(List<Insertable<Evenement>> rows) => batch((batch) =>
      batch.insertAll(evenements, rows, mode: InsertMode.replace));
  Future insertEvenement(Insertable<Evenement> row) => into(evenements)
      .insert(row, mode: InsertMode.replace);
  Future updateEvenement(Insertable<Evenement> row) => update(evenements).replace(row);
  Future deleteEvenement(Insertable<Evenement> row) => delete(evenements).delete(row);

  Stream<List<Evenement>> watchAllEvenementByIdPer(int idPer) {
    return (select(evenements)
      ..orderBy(
        ([
            (t) => OrderingTerm(expression: t.debut, mode: OrderingMode.desc),
        ]),
      )..where((tbl) => tbl.id_personne.equals(idPer))
    ).watch();
  }

  Future<List<Evenement>> getAllEvenementByIdPer(int idPer) {
    return (select(evenements)
      ..where((tbl) => tbl.id_personne.equals(idPer))
    ).get();
  }

  Future<Evenement?> getEvenementByIdEve(int idEve) {
    return (select(evenements)
      ..where((tbl) => tbl.id_evenement.equals(idEve))
    ).getSingleOrNull();
  }

  Future<Evenement?> getEvenementByIdEveAndIdPer({required int idEve, required int idPer}) {
    return (select(evenements)
      ..where((tbl) => tbl.id_evenement.equals(idEve) & tbl.id_personne.equals(idPer))
    ).getSingleOrNull();
  }

  Future<int> deleteAllByIdPersonne({required int id}) {
    return (delete(evenements)
      ..where((tbl) => tbl.id_personne.equals(id))
    ).go();
  }

}