import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'personne_enseignants.g.dart';

class PersonneEnseignants extends Table {
  IntColumn get id_personne => integer()();
  TextColumn get nom => text().nullable()();
  TextColumn get prenom => text().nullable()();
  IntColumn get id_agenda => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id_agenda};
}

// @DriftAccessor(tables: [PersonneEnseignants])
@UseDao(tables: [PersonneEnseignants])
class PersonneEnseignantsDao extends DatabaseAccessor<AppDatabase> with _$PersonneEnseignantsDaoMixin {
  final AppDatabase db;
  PersonneEnseignantsDao(this.db) : super(db);

  Stream<List<PersonneEnseignant>> watchAllPersonneEnseignant() => select(personneEnseignants).watch();
  Future<List<PersonneEnseignant>> getAllPersonneEnseignants() => select(personneEnseignants).get();

  Future<void> insertAllPersonneEnseignant(List<Insertable<PersonneEnseignant>> rows) =>
      batch((batch) => batch.insertAll(personneEnseignants, rows, mode: InsertMode.replace));
  Future insertPersonneEnseignant(Insertable<PersonneEnseignant> row) =>
      into(personneEnseignants).insert(row, mode: InsertMode.replace);
  Future updatePersonneEnseignant(Insertable<PersonneEnseignant> row) => update(personneEnseignants).replace(row);
  Future deletePersonneEnseignant(Insertable<PersonneEnseignant> row) => delete(personneEnseignants).delete(row);

  Stream<List<PersonneEnseignant>> watchAllPersonneEnseignantsById(int id) {
    return (select(personneEnseignants)..where((t) => t.id_personne.equals(id))).watch();
  }

  Future<PersonneEnseignant?> getPersonneById(int idAgenda) {
    return (select(personneEnseignants)..where((t) => t.id_agenda.equals(idAgenda))).getSingleOrNull();
  }
}
