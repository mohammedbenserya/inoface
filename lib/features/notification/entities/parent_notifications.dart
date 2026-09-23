import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'parent_notifications.g.dart';

class ParentNotifications extends Table {

  IntColumn get id_parent_notification => integer()();
  TextColumn get titre => text().withDefault(const Constant(''))();
  TextColumn get detail => text().nullable()();
  DateTimeColumn get date_de_notification => dateTime()();

  @override
  Set<Column> get primaryKey => {id_parent_notification};

}

// @DriftAccessor(tables: [ParentNotifications])
@UseDao(tables: [ParentNotifications])
class ParentNotificationsDao extends DatabaseAccessor<AppDatabase>
    with _$ParentNotificationsDaoMixin {

  final AppDatabase db;
  ParentNotificationsDao(this.db) : super(db);

  Stream<List<ParentNotification>> watchAllParentNotifications() => select(parentNotifications).watch();
  Future<List<ParentNotification>> getAllParentNotifications() => select(parentNotifications).get();

  Future<void> insertAllParentNotifications(List<Insertable<ParentNotification>> rows) => batch((batch) =>
      batch.insertAll(parentNotifications, rows, mode: InsertMode.replace));
  Future insertParentNotifications(Insertable<ParentNotification> row) => into(parentNotifications).insert(row, mode: InsertMode.replace);
  Future updateParentNotifications(Insertable<ParentNotification> row) => update(parentNotifications).replace(row);
  Future deleteParentNotifications(Insertable<ParentNotification> row) => delete(parentNotifications).delete(row);

  Future<ParentNotification?> getParentNotificationsById({required int idNotify}) {
    return (select(parentNotifications)
      ..where((tbl) => tbl.id_parent_notification.equals(idNotify))
    ).getSingleOrNull();
  }

  Stream<List<ParentNotification>> watchAooParentNotificationsByDate() {
    return (select(parentNotifications)
      ..orderBy([
          (t) => OrderingTerm(expression: t.date_de_notification, mode: OrderingMode.desc)
      ])
    ).watch();
  }
}

