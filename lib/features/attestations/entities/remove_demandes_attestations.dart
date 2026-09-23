import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'remove_demandes_attestations.g.dart';

class RemoveDemandesAttestations extends Table {

  //IntColumn get id => integer().autoIncrement()();
  IntColumn get id_eleve_scolaire => integer()();
  IntColumn get id_personne => integer()();
  BoolColumn get send => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id_eleve_scolaire};
}

// @DriftAccessor(tables: [RemoveDemandesAttestations])
@UseDao(tables: [RemoveDemandesAttestations])
class RemoveDemandesAttestationsDao extends DatabaseAccessor<AppDatabase>
    with _$RemoveDemandesAttestationsDaoMixin {

  final AppDatabase db;
  RemoveDemandesAttestationsDao(this.db) : super(db);

  Stream<List<RemoveDemandesAttestation>> watchAllRemoveDemandesAttestations() => select(removeDemandesAttestations).watch();
  Future<List<RemoveDemandesAttestation>> getAllRemoveDemandesAttestations() => select(removeDemandesAttestations).get();

  Future<void> insertAllRemoveDemandesAttestations(List<Insertable<RemoveDemandesAttestation>> rows) => batch((batch) =>
      batch.insertAll(removeDemandesAttestations, rows, mode: InsertMode.replace));
  Future insertRemoveDemandesAttestations(Insertable<RemoveDemandesAttestation> row) => into(removeDemandesAttestations).insert(row, mode: InsertMode.replace);
  Future updateRemoveDemandesAttestations(Insertable<RemoveDemandesAttestation> row) => update(removeDemandesAttestations).replace(row);
  Future deleteRemoveDemandesAttestations(Insertable<RemoveDemandesAttestation> row) => delete(removeDemandesAttestations).delete(row);

  // Stream<List<RemoveDemandesAttestation>> watchAllRemoveDemandesAttestationsById(int id_eleve_attestation_scolaire) {
  //   return (select(removeDemandesAttestations)
  //     ..orderBy(
  //       ([
  //             (t) => OrderingTerm(expression: t.date_de_la_demande, mode: OrderingMode.desc),
  //       ]),
  //     )..where((t) => t.id_personne_eleve.equals(id_eleve_attestation_scolaire))).watch();
  // }


  Future<RemoveDemandesAttestation?> getAllRemoveDemandesAttestationsById({required int idEleve}) {
    return (select(removeDemandesAttestations)
      ..where((t) => t.id_eleve_scolaire.equals(idEleve))).getSingleOrNull();
  }

  Future<int> deleteAllByIdEleve({required int id}) {
    return (delete(removeDemandesAttestations)
      ..where((tbl) => tbl.id_eleve_scolaire.equals(id))
    ).go();
  }
}
