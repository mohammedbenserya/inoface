import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'demandes_attestations.g.dart';

class DemandesAttestations extends Table {

  IntColumn get id_eleve_attestation_scolaire => integer()();
  IntColumn get id_personne_parent => integer().nullable()();
  IntColumn get id_personne_eleve => integer()();
  DateTimeColumn get date_de_la_demande => dateTime()();
  DateTimeColumn get date_de_la_reception => dateTime().nullable()();
  IntColumn get nombre_de_copies => integer()();
  IntColumn get idstatut => integer().withDefault(const Constant(0))();
  TextColumn get statut => text().nullable()();
  TextColumn get parentnom => text().nullable()();
  BoolColumn get remove => boolean().withDefault(const Constant(false)).nullable()();
  BoolColumn get send => boolean().withDefault(const Constant(false)).nullable()();

  @override
  Set<Column> get primaryKey => {id_eleve_attestation_scolaire};

}

// @DriftAccessor(tables: [DemandesAttestations])
@UseDao(tables: [DemandesAttestations])
class DemandesAttestationsDao extends DatabaseAccessor<AppDatabase>
    with _$DemandesAttestationsDaoMixin {

  final AppDatabase db;
  DemandesAttestationsDao(this.db) : super(db);

  Stream<List<DemandesAttestation>> watchAllDemandesAttestations() => select(demandesAttestations).watch();
  Future<List<DemandesAttestation>> getAllDemandesAttestations() => select(demandesAttestations).get();

  Future<void> insertAllDemandesAttestations(List<Insertable<DemandesAttestation>> rows) => batch((batch) =>
      batch.insertAll(demandesAttestations, rows, mode: InsertMode.replace));
  Future insertDemandesAttestations(Insertable<DemandesAttestation> row) => into(demandesAttestations).insert(row, mode: InsertMode.replace);
  Future updateDemandesAttestations(Insertable<DemandesAttestation> row) => update(demandesAttestations).replace(row);
  Future deleteDemandesAttestations(Insertable<DemandesAttestation> row) => delete(demandesAttestations).delete(row);

  Stream<List<DemandesAttestation>> watchAllDemandesAttestationsById(int id_eleve_attestation_scolaire) {
    return (select(demandesAttestations)
      ..orderBy(
        ([
            (t) => OrderingTerm(expression: t.date_de_la_demande, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.id_eleve_attestation_scolaire, mode: OrderingMode.desc),
        ]),
      )..where((t) => t.id_personne_eleve.equals(id_eleve_attestation_scolaire))).watch();
  }

  Future<List<DemandesAttestation>> getAllDemandesAttestationsById(int id_eleve) {
    return (select(demandesAttestations)
      ..orderBy(
        ([
              (t) => OrderingTerm(expression: t.date_de_la_demande, mode: OrderingMode.desc),
        ]),
      )..where((t) => t.id_personne_eleve.equals(id_eleve))).get();
  }

  Future<void> updateDemandesAttestationById({
    required int idEleveScolaire,
    required DemandesAttestation demand,
    required bool remove,
  }) {
    return (update(demandesAttestations)
      ..where((t) => t.id_eleve_attestation_scolaire.equals(idEleveScolaire))
    ).write(demand.copyWith(remove: remove));
    // ).write(demand.copyWith(remove: Value(remove)));
  }

  Future<DemandesAttestation?> getDemandesAttestationsById(int id_eleve_attestation_scolaire) {
    return (select(demandesAttestations)
      ..where((t) => t.id_eleve_attestation_scolaire.equals(id_eleve_attestation_scolaire))).getSingleOrNull();
  }

  Future<List<DemandesAttestation>> getAllDemandesAttestationsBySend(bool send) {
    return (select(demandesAttestations)
      ..where((t) => t.send.equals(send))).get();
  }

  Future<List<DemandesAttestation>> getAllDemandesAttestationsByStatut({required int idPersonne, required int idstatut}) {
    return (select(demandesAttestations)
      ..where((t) => t.id_personne_eleve.equals(idPersonne) & t.idstatut.equals(idstatut))).get();
  }

  Future<int> deleteAllByIdPersonneEleve({required int id}) {
    return (delete(demandesAttestations)
      ..where((tbl) => tbl.id_personne_eleve.equals(id))
    ).go();
  }
}