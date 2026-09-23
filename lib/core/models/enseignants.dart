import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'enseignants.g.dart';

class Enseignants extends Table {

  IntColumn get id => integer().autoIncrement()();
  IntColumn get id_personne => integer()();
  TextColumn get nom => text().nullable()();
  TextColumn get prenom => text().nullable()();
  IntColumn get id_jour => integer()();

  // @override
  // Set<Column> get primaryKey => {id_jour};

}

// @DriftAccessor(tables: [Enseignants])
@UseDao(tables: [Enseignants])
class EnseignantsDao extends DatabaseAccessor<AppDatabase>
    with _$EnseignantsDaoMixin {

  final AppDatabase db;
  EnseignantsDao(this.db) : super(db);

  Stream<List<Enseignant>> watchAllEnseignant() => select(enseignants).watch();
  Future<List<Enseignant>> getAllEnseignant() => select(enseignants).get();

  Future<void> insertAllEnseignant(List<Insertable<Enseignant>> rows) => batch((batch) => batch.insertAll(enseignants, rows, mode: InsertMode.replace));
  Future insertEnseignant(Insertable<Enseignant> row) => into(enseignants).insert(row, mode: InsertMode.replace);
  Future updateEnseignant(Insertable<Enseignant> row) => update(enseignants).replace(row);
  Future deleteEnseignant(Insertable<Enseignant> row) => delete(enseignants).delete(row);

  Future<List<Enseignant>> getEnseignantByIdJour(int idJour) {
    return (select(enseignants)
      ..where((tbl) => tbl.id_jour.equals(idJour))
    ).get();
  }
}