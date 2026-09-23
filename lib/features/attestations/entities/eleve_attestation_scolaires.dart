import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'eleve_attestation_scolaires.g.dart';

class EleveAttestationScolaires extends Table {

  IntColumn get id_eleve_attestation_scolaire => integer()();
  IntColumn get id_personne_parent => integer()();
  IntColumn get id_personne_eleve => integer()();
  DateTimeColumn get date_de_la_demande => dateTime().nullable()();
  DateTimeColumn get date_de_la_reception => dateTime().nullable()();
  IntColumn get nombre_de_copies => integer()();
  IntColumn get idstatut => integer().withDefault(const Constant(0))();
  TextColumn get statut => text().nullable()();

  @override
  Set<Column> get primaryKey => {id_eleve_attestation_scolaire};

}

// @DriftAccessor(tables: [EleveAttestationScolaires])
@UseDao(tables: [EleveAttestationScolaires])
class EleveAttestationScolairesDao extends DatabaseAccessor<AppDatabase>
    with _$EleveAttestationScolairesDaoMixin {

  final AppDatabase db;
  EleveAttestationScolairesDao(this.db) : super(db);

  Stream<List<EleveAttestationScolaire>> watchAllAttestationScolaire() => select(eleveAttestationScolaires).watch();
  Future<List<EleveAttestationScolaire>> getAllAttestationScolaire() => select(eleveAttestationScolaires).get();

  Future<void> insertAllAttestationScolaire(List<Insertable<EleveAttestationScolaire>> rows) => batch((batch) =>
      batch.insertAll(eleveAttestationScolaires, rows, mode: InsertMode.replace));
  Future insertAttestationScolaire(Insertable<EleveAttestationScolaire> row) => into(eleveAttestationScolaires).insert(row, mode: InsertMode.replace);
  Future updateAttestationScolaire(Insertable<EleveAttestationScolaire> row) => update(eleveAttestationScolaires).replace(row);
  Future deleteAttestationScolaire(Insertable<EleveAttestationScolaire> row) => delete(eleveAttestationScolaires).delete(row);

  Stream<List<EleveAttestationScolaire>> watchAllAttestationScolaireById(int id_eleve_attestation_scolaire) {
    return (select(eleveAttestationScolaires)
      ..where((t) => t.id_eleve_attestation_scolaire.equals(id_eleve_attestation_scolaire))).watch();
  }

  Future<List<EleveAttestationScolaire>> getAllAttestationScolaireById(int id_eleve_attestation_scolaire) {
    return (select(eleveAttestationScolaires)
      ..where((t) => t.id_eleve_attestation_scolaire.equals(id_eleve_attestation_scolaire))).get();
  }

  Future<int> deleteAllByIdPersonneEleve({required int id}) {
    return (delete(eleveAttestationScolaires)
      ..where((tbl) => tbl.id_personne_eleve.equals(id))
    ).go();
  }
}