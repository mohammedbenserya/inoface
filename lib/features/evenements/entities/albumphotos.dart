import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'albumphotos.g.dart';

class Albumphotos extends Table {

  IntColumn get id_communication_photo => integer()();
  TextColumn get photo_description => text().nullable()();
  TextColumn get lien_piece_jointe => text().nullable()();
  IntColumn get position => integer()();
  IntColumn get id_evenement => integer()();

  @override
  Set<Column> get primaryKey => {id_communication_photo};

}

// @DriftAccessor(tables: [Albumphotos])
@UseDao(tables: [Albumphotos])
class AlbumphotosDao extends DatabaseAccessor<AppDatabase>
    with _$AlbumphotosDaoMixin {

  final AppDatabase db;
  AlbumphotosDao(this.db) : super(db);

  Stream<List<Albumphoto>> watchAllAlbumphoto() => select(albumphotos).watch();
  Future<List<Albumphoto>> getAllAlbumphoto() => select(albumphotos).get();

  Future<void> insertAllAlbumphoto(List<Insertable<Albumphoto>> rows) => batch((batch) => batch.insertAll(albumphotos, rows, mode: InsertMode.replace));
  Future insertAlbumphoto(Insertable<Albumphoto> row) => into(albumphotos).insert(row, mode: InsertMode.replace);
  Future updateAlbumphoto(Insertable<Albumphoto> row) => update(albumphotos).replace(row);
  Future deleteAlbumphoto(Insertable<Albumphoto> row) => delete(albumphotos).delete(row);

  Stream<List<Albumphoto>> watchAlbumphotoById(int idEvenement) {
    return (select(albumphotos)
      ..where((t) => t.id_evenement.equals(idEvenement))).watch();
  }

  Future<List<Albumphoto>> getAlbumphotoByIdEve(int idEvenement) {
    return (select(albumphotos)
      ..where((t) => t.id_evenement.equals(idEvenement))).get();
  }

  Future<int> deleteAllByIdEvenement({required int id}) {
    return (delete(albumphotos)
      ..where((tbl) => tbl.id_evenement.equals(id))
    ).go();
  }
}