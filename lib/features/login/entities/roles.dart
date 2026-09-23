import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'roles.g.dart';

class Roles extends Table {

  IntColumn get id_role => integer()();
  TextColumn get role_description => text().nullable()();
  IntColumn get default_role => integer().nullable()();
  IntColumn get id_personne => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id_role};
}

// @DriftAccessor(tables: [Roles])
@UseDao(tables: [Roles])
class RolesDao extends DatabaseAccessor<AppDatabase>
    with _$RolesDaoMixin {

  final AppDatabase db;
  RolesDao(this.db) : super(db);

  Stream<List<Role>> watchAllRole() => select(roles).watch();
  Future<List<Role>> getAllRole() => select(roles).get();

  Future<void> insertAllRole(List<Insertable<Role>> rows) => batch((batch) => batch.insertAll(roles, rows, mode: InsertMode.replace));
  Future insertRole(Insertable<Role> row) => into(roles).insert(row, mode: InsertMode.replace);
  Future updateRole(Insertable<Role> row) => update(roles).replace(row);
  Future deleteRole(Insertable<Role> row) => delete(roles).delete(row);

}