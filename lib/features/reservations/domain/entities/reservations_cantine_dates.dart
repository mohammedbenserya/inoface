import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'reservations_cantine_dates.g.dart';

class ReservationsCantineDates extends Table {


  // IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date_cantine => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {date_cantine};

}

// @DriftAccessor(tables: [ReservationsCantineDates])
@UseDao(tables: [ReservationsCantineDates])
class ReservationsCantineDatesDao extends DatabaseAccessor<AppDatabase>
    with _$ReservationsCantineDatesDaoMixin {

  final AppDatabase db;
  ReservationsCantineDatesDao(this.db) : super(db);

  Stream<List<ReservationsCantineDate>> watchAllReservationsCantineDates() => select(reservationsCantineDates).watch();
  Future<List<ReservationsCantineDate>> getAllReservationsCantineDates() => select(reservationsCantineDates).get();

  Future<void> insertAllReservationsCantineDates(List<Insertable<ReservationsCantineDate>> rows) => batch((batch) =>
      batch.insertAll(reservationsCantineDates, rows, mode: InsertMode.replace));
  Future insertReservationsCantineDates(Insertable<ReservationsCantineDate> row) => into(reservationsCantineDates).insert(row, mode: InsertMode.replace);
  Future updateReservationsCantineDates(Insertable<ReservationsCantineDate> row) => update(reservationsCantineDates).replace(row);
  Future deleteReservationsCantineDates(Insertable<ReservationsCantineDate> row) => delete(reservationsCantineDates).delete(row);
}