import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'devoir_piecesjointes.g.dart';

class DevoirPiecesjointes extends Table {

  IntColumn get id_devoir_piece_jointe => integer()();
  TextColumn get nom_original_piece_jointe => text().nullable()();
  TextColumn get lieu_piece_jointe => text().nullable()();
  IntColumn get position => integer()();
  IntColumn get id_devoir => integer()();

  @override
  Set<Column> get primaryKey => {id_devoir_piece_jointe};

}

// @DriftAccessor(tables: [DevoirPiecesjointes])
@UseDao(tables: [DevoirPiecesjointes])
class DevoirPiecesjointesDao extends DatabaseAccessor<AppDatabase>
    with _$DevoirPiecesjointesDaoMixin {

  final AppDatabase db;
  DevoirPiecesjointesDao(this.db) : super(db);

  Stream<List<DevoirPiecesjointe>> watchAllDevoirPiecesjointe() => select(devoirPiecesjointes).watch();
  Future<List<DevoirPiecesjointe>> getAllDevoirPiecesjointe() => select(devoirPiecesjointes).get();

  Future<void> insertAllDevoirPiecesjointe(List<Insertable<DevoirPiecesjointe>> rows) => batch((batch) => batch.insertAll(devoirPiecesjointes, rows, mode: InsertMode.replace));
  Future insertDevoirPiecesjointe(Insertable<DevoirPiecesjointe> row) => into(devoirPiecesjointes).insert(row, mode: InsertMode.replace);
  Future updateDevoirPiecesjointe(Insertable<DevoirPiecesjointe> row) => update(devoirPiecesjointes).replace(row);
  Future deleteDevoirPiecesjointe(Insertable<DevoirPiecesjointe> row) => delete(devoirPiecesjointes).delete(row);

  Stream<List<DevoirPiecesjointe>> watchDevoirPiecesjointeById(int id) {
    return (select(devoirPiecesjointes)
      ..where((t) => t.id_devoir.equals(id))).watch();
  }

  Future<List<DevoirPiecesjointe>> getDevoirPiecesjointeByById(int id) {
    return (select(devoirPiecesjointes)
      ..where((t) => t.id_devoir.equals(id))).get();
  }
}
