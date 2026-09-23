import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'count_notifications.g.dart';

class CountNotifications extends Table {

  IntColumn get idNotifications => integer()();

  @override
  Set<Column> get primaryKey => {idNotifications};
}

// @DriftAccessor(tables: [CountNotifications])
@UseDao(tables: [CountNotifications])
class CountNotificationsDao extends DatabaseAccessor<AppDatabase>
    with _$CountNotificationsDaoMixin {

  final AppDatabase db;
  CountNotificationsDao(this.db) : super(db);

  Stream<List<CountNotification>> watchAllCountNotification() => select(countNotifications).watch();
  Future<List<CountNotification>> getAllCountNotification() => select(countNotifications).get();

  Future<void> insertAllCountNotification(List<Insertable<CountNotification>> rows) => batch((batch) =>
      batch.insertAll(countNotifications, rows, mode: InsertMode.insertOrReplace));
  Future insertCountNotification(Insertable<CountNotification> row) => into(countNotifications).insert(row, mode: InsertMode.replace);
  Future updateCountNotification(Insertable<CountNotification> row) => update(countNotifications).replace(row);
  Future deleteCountNotification(Insertable<CountNotification> row) => delete(countNotifications).delete(row);

  Future<CountNotification?> getCountNotificationByIdPerAndId({required int idnotify}) {
    return (select(countNotifications)
      ..where((tbl) => tbl.idNotifications.equals(idnotify))
    ).getSingleOrNull();
  }

  Stream<CountNotification?> watchCountNotificationByIdPerAndId({required int idnotify}) {
    return (select(countNotifications)
      ..where((tbl) => tbl.idNotifications.equals(idnotify))
    ).watchSingleOrNull();
  }

}