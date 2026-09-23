import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'piecesjointes.g.dart';

class Piecesjointes extends Table {

  IntColumn get id_communication_piece_jointe => integer()();
  TextColumn get lien_piece_jointe => text().nullable()();
  IntColumn get id_evenement => integer().nullable()();
  IntColumn get id_information => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id_communication_piece_jointe};

}

// @DriftAccessor(tables: [Piecesjointes])
@UseDao(tables: [Piecesjointes])
class PiecesjointesDao extends DatabaseAccessor<AppDatabase>
    with _$PiecesjointesDaoMixin {

  final AppDatabase db;
  PiecesjointesDao(this.db) : super(db);

  Stream<List<Piecesjointe>> watchAllPiecesjointe() => select(piecesjointes).watch();
  Future<List<Piecesjointe>> getAllPiecesjointe() => select(piecesjointes).get();

  Future<void> insertAllPiecesjointe(List<Insertable<Piecesjointe>> rows) => batch((batch) => batch.insertAll(piecesjointes, rows, mode: InsertMode.replace));
  Future insertPiecesjointe(Insertable<Piecesjointe> row) => into(piecesjointes).insert(row, mode: InsertMode.replace);
  Future updatePiecesjointe(Insertable<Piecesjointe> row) => update(piecesjointes).replace(row);
  Future deletePiecesjointe(Insertable<Piecesjointe> row) => delete(piecesjointes).delete(row);

  Future<List<Piecesjointe>> getAllPiecesjointeByIdPer(int idInfo) {
    return (select(piecesjointes)
      ..where((tbl) => tbl.id_information.equals(idInfo))
    ).get();
  }

  Future<List<Piecesjointe>> getAllPiecesjointeByIdEve(int idEve) {
    return (select(piecesjointes)
      ..where((tbl) => tbl.id_evenement.equals(idEve))
    ).get();
  }

  Future<int> deleteAllByIdInformation({required int id}) {
    return (delete(piecesjointes)
      ..where((tbl) => tbl.id_information.equals(id))
    ).go();
  }

  Future<int> deleteAllByIdEvenement({required int id}) {
    return (delete(piecesjointes)
      ..where((tbl) => tbl.id_evenement.equals(id))
    ).go();
  }
}