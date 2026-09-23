import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'enfants.g.dart';

class Enfants extends Table {
  IntColumn get id_personne => integer()();
  TextColumn get nom => text()();
  TextColumn get prenom => text()();
  TextColumn get nom_arabe => text().nullable()();
  TextColumn get prenom_arabe => text().nullable()();
  TextColumn get identifiant => text().nullable()();
  TextColumn get cin => text().nullable()();
  TextColumn get gsm => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get genre => text().nullable()();
  TextColumn get token => text().nullable()();
  TextColumn get niveau => text().nullable()();
  TextColumn get classe => text()();
  TextColumn get photo => text().nullable()();
  BoolColumn get has_agenda => boolean().withDefault(const Constant(false))();
  BoolColumn get has_devoir => boolean().withDefault(const Constant(false))();
  BoolColumn get has_cantine => boolean().nullable().withDefault(const Constant(false))();
  BoolColumn get has_ControlesNotes => boolean().nullable().withDefault(const Constant(false))();
  TextColumn get emploitempspdf => text().nullable()();

  @override
  Set<Column> get primaryKey => {id_personne};
}

// @DriftAccessor(tables: [Enfants])
@UseDao(tables: [Enfants])
class EnfantsDao extends DatabaseAccessor<AppDatabase> with _$EnfantsDaoMixin {
  final AppDatabase db;
  EnfantsDao(this.db) : super(db);

  Stream<List<Enfant>> watchAllEnfant() => select(enfants).watch();
  Future<List<Enfant>> getAllEnfant() => select(enfants).get();

  Future<void> insertAllEnfant(List<Insertable<Enfant>> rows) =>
      batch((batch) => batch.insertAll(enfants, rows, mode: InsertMode.replace));
  Future insertEnfant(Insertable<Enfant> row) => into(enfants).insert(row, mode: InsertMode.replace);
  Future updateEnfant(Insertable<Enfant> row) => update(enfants).replace(row);
  Future deleteEnfant(Insertable<Enfant> row) => delete(enfants).delete(row);

  Future<Enfant?> getEnfantById(int idPer) {
    return (select(enfants)..where((tbl) => tbl.id_personne.equals(idPer))).getSingleOrNull();
  }

  Future<List<Enfant>> getEnfantByDate() {
    return (select(enfants)..orderBy([(t) => OrderingTerm(expression: t.prenom, mode: OrderingMode.asc)])).get();
  }
}
