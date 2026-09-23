import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'personnes.g.dart';

class Personnes extends Table {
  IntColumn get id_personne => integer()();
  TextColumn get nom => text().nullable()();
  TextColumn get prenom => text().nullable()();
  TextColumn get nom_arabe => text().nullable()();
  TextColumn get prenom_arabe => text().nullable()();
  TextColumn get identifiant => text().nullable()();
  TextColumn get cin => text().nullable()();
  TextColumn get gsm => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get genre => text().nullable()();
  TextColumn get token => text().nullable()();
  TextColumn get ecolecode => text().nullable()();

  @override
  Set<Column> get primaryKey => {id_personne};
}

// @DriftAccessor(tables: [Personnes])
@UseDao(tables: [Personnes])
class PersonnesDao extends DatabaseAccessor<AppDatabase> with _$PersonnesDaoMixin {
  final AppDatabase db;
  PersonnesDao(this.db) : super(db);

  Stream<List<Personne>> watchAllPersonne() => select(personnes).watch();
  Future<List<Personne>> getAllPersonne() => select(personnes).get();
  Future<Personne?> getPersonne() => select(personnes).getSingleOrNull();

  Future<void> insertAllPersonne(List<Insertable<Personne>> rows) =>
      batch((batch) => batch.insertAll(personnes, rows, mode: InsertMode.replace));
  Future insertPersonne(Insertable<Personne> row) => into(personnes).insert(row, mode: InsertMode.replace);
  Future updatePersonne(Insertable<Personne> row) => update(personnes).replace(row);
  Future deletePersonne(Insertable<Personne> row) => delete(personnes).delete(row);
}
