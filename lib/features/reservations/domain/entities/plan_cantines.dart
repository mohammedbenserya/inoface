import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'plan_cantines.g.dart';

class PlanCantines extends Table {
  // IntColumn get id => integer().autoIncrement()();
  IntColumn get id_cantine_type => integer()();
  DateTimeColumn get date_cantine => dateTime().nullable()();
  TextColumn get cantine_type_description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id_cantine_type};
}

// @DriftAccessor(tables: [PlanCantines])
@UseDao(tables: [PlanCantines])
class PlanCantinesDao extends DatabaseAccessor<AppDatabase> with _$PlanCantinesDaoMixin {
  final AppDatabase db;
  PlanCantinesDao(this.db) : super(db);

  Stream<List<PlanCantine>> watchAllPlanCantines() => select(planCantines).watch();
  Future<List<PlanCantine>> getAllPlanCantines() => select(planCantines).get();

  Future<void> insertAllPlanCantines(List<Insertable<PlanCantine>> rows) =>
      batch((batch) => batch.insertAll(planCantines, rows, mode: InsertMode.replace));
  Future insertPlanCantines(Insertable<PlanCantine> row) => into(planCantines).insert(row, mode: InsertMode.replace);
  Future updatePlanCantines(Insertable<PlanCantine> row) => update(planCantines).replace(row);
  Future deletePlanCantines(Insertable<PlanCantine> row) => delete(planCantines).delete(row);

  Future<PlanCantine?> getPlanCantinesByData({required DateTime date}) {
    return (select(planCantines)..where((tbl) => tbl.date_cantine.equals(date))).getSingleOrNull();
  }
}
