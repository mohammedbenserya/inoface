import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'devoirs.g.dart';

class Devoirs extends Table {

  IntColumn get id_devoir => integer()();
  IntColumn get id_personne => integer()();
  TextColumn get devoir_description => text().nullable()();
  TextColumn get devoir_detail => text().nullable()();
  TextColumn get matiere => text().nullable()();
  TextColumn get devoirtype => text().nullable()();
  TextColumn get devoirendrroit => text().nullable()();
  IntColumn get position => integer()();
  DateTimeColumn get date_devoir => dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Set<Column> get primaryKey => {id_devoir};

}

// @DriftAccessor(tables: [Devoirs])
@UseDao(tables: [Devoirs])
class DevoirsDao extends DatabaseAccessor<AppDatabase>
    with _$DevoirsDaoMixin {

  final AppDatabase db;
  DevoirsDao(this.db) : super(db);

  Stream<List<Devoir>> watchAllDevoir() => select(devoirs).watch();
  Future<List<Devoir>> getAllDevoir() => select(devoirs).get();

  Future<void> insertAllDevoir(List<Insertable<Devoir>> rows) => batch((batch) => batch.insertAll(devoirs, rows, mode: InsertMode.replace));
  Future insertDevoir(Insertable<Devoir> row) => into(devoirs).insert(row, mode: InsertMode.replace);
  Future updateDevoir(Insertable<Devoir> row) => update(devoirs).replace(row);
  Future deleteDevoir(Insertable<Devoir> row) => delete(devoirs).delete(row);

  Stream<List<Devoir>> watchDevoirById(int id) {
    return (select(devoirs)
      ..where((t) => t.id_devoir.equals(id))).watch();
  }

  Future<List<Devoir>> getDevoirByIdDevoir(int id) {
    return (select(devoirs)
      ..where((t) => t.id_devoir.equals(id))).get();
  }

  Future<List<Devoir>> getDevoirByDateAndIdPer({required DateTime dateTime, required int idPer}) {
    return (select(devoirs)
      ..orderBy([
         (t) => OrderingTerm(expression: t.matiere, mode: OrderingMode.desc)
      ])..where((t) => t.date_devoir.equals(dateTime) & t.id_personne.equals(idPer))).get();
  }

  Future<List<Devoir>> getDevoirByIdPersonne(int id) {
    return (select(devoirs)
      ..where((t) => t.id_personne.equals(id))).get();
  }

  Stream<List<Devoir>> watchDevoirByIdPersonne(int id) {
    return (select(devoirs)
      ..where((t) => t.id_personne.equals(id))).watch();
  }
}