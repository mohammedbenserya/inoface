import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'plats.g.dart';

class Plats extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get cantine_type_repas_description => text().withDefault(const Constant('')).nullable()();
  TextColumn get plat => text().withDefault(const Constant('')).nullable()();
  IntColumn get position => integer().withDefault(const Constant(0))();
  IntColumn get id_cantine_type => integer().nullable()();

  // @override
  // Set<Column> get primaryKey => {id_cantine_type};

}

// @DriftAccessor(tables: [Plats])
@UseDao(tables: [Plats])
class PlatsDao extends DatabaseAccessor<AppDatabase> with _$PlatsDaoMixin {
  final AppDatabase db;
  PlatsDao(this.db) : super(db);

  Stream<List<Plat>> watchAllPlats() => select(plats).watch();
  Future<List<Plat>> getAllPlats() => select(plats).get();

  Future<void> insertAllPlats(List<Insertable<Plat>> rows) =>
      batch((batch) => batch.insertAll(plats, rows, mode: InsertMode.replace));
  Future insertPlats(Insertable<Plat> row) => into(plats).insert(row, mode: InsertMode.replace);
  Future updatePlats(Insertable<Plat> row) => update(plats).replace(row);
  Future deletePlats(Insertable<Plat> row) => delete(plats).delete(row);

  Future<List<Plat>> getPlanCantinesByData({required int idCantine}) {
    return (select(plats)
      ..orderBy([
         (t) => OrderingTerm(expression: t.position, mode: OrderingMode.asc)
      ])
      ..where((tbl) => tbl.id_cantine_type.equals(idCantine))).get();
  }
}
