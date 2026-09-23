import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'reservations_cantines.g.dart';

class ReservationsCantines extends Table {
  IntColumn get id_cantine_journaliere => integer()();
  IntColumn get id_personne_parent => integer().nullable()();
  IntColumn get id_personne_eleve => integer().nullable()();
  TextColumn get parentnom => text().withDefault(const Constant('')).nullable()();
  IntColumn get Paiement => integer().nullable()();
  DateTimeColumn get date_cantine => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id_cantine_journaliere};
}

// @DriftAccessor(tables: [ReservationsCantines])
@UseDao(tables: [ReservationsCantines])
class ReservationsCantinesDao extends DatabaseAccessor<AppDatabase> with _$ReservationsCantinesDaoMixin {
  final AppDatabase db;
  ReservationsCantinesDao(this.db) : super(db);

  Stream<List<ReservationsCantine>> watchAllReservationsCantines() => select(reservationsCantines).watch();
  Future<List<ReservationsCantine>> getAllReservationsCantines() => select(reservationsCantines).get();

  Future<void> insertAllReservationsCantines(List<Insertable<ReservationsCantine>> rows) =>
      batch((batch) => batch.insertAll(reservationsCantines, rows, mode: InsertMode.replace));
  Future insertReservationsCantines(Insertable<ReservationsCantine> row) =>
      into(reservationsCantines).insert(row, mode: InsertMode.replace);
  Future updateReservationsCantines(Insertable<ReservationsCantine> row) => update(reservationsCantines).replace(row);
  Future deleteReservationsCantines(Insertable<ReservationsCantine> row) => delete(reservationsCantines).delete(row);

  Future<void> deleteReservationsById({required int journaliere}) {
    return (delete(reservationsCantines)..where((tbl) => tbl.id_cantine_journaliere.equals(journaliere))).go();
  }

  Future<ReservationsCantine?> getReservationsByDate({required DateTime date}) {
    return (select(reservationsCantines)..where((tbl) => tbl.date_cantine.equals(date))).getSingleOrNull();
  }

  Stream<ReservationsCantine?> watchReservationsByDate({required DateTime date}) {
    return (select(reservationsCantines)..where((tbl) => tbl.date_cantine.equals(date))).watchSingleOrNull();
  }
}
