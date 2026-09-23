import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'emploitemps.g.dart';

class Emploitemps extends Table {

  IntColumn get id => integer().autoIncrement()();
  IntColumn get id_jour => integer()();
  IntColumn get id_personne_eleve => integer()();
  TextColumn get Jour => text().nullable()();

  // @override
  // Set<Column> get primaryKey => {id};


  /*
    //! this is id_jour = json['id_jour'];
  //! value of this field is come from json['id_jour'];
  IntColumn get id_jour_emploitemps => integer()();

  //! this random id
  IntColumn get id_jour => integer()();
  IntColumn get id_personne_eleve => integer()();
  TextColumn get Jour => text().nullable()();
   */

}

// @DriftAccessor(tables: [Emploitemps])
@UseDao(tables: [Emploitemps])
class EmploitempsDao extends DatabaseAccessor<AppDatabase>
    with _$EmploitempsDaoMixin {

  final AppDatabase db;
  EmploitempsDao(this.db) : super(db);

  Stream<List<Emploitemp>> watchAllEmploitemp() => select(emploitemps).watch();
  Future<List<Emploitemp>> getAllEmploitemp() => select(emploitemps).get();

  Future<void> insertAllEmploitemp(List<Insertable<Emploitemp>> rows) => batch((batch) => batch.insertAll(emploitemps, rows, mode: InsertMode.replace));
  Future<int> insertEmploitemp(Insertable<Emploitemp> row) => into(emploitemps).insert(row, mode: InsertMode.replace);
  Future<bool> updateEmploitemp(Insertable<Emploitemp> row) => update(emploitemps).replace(row);
  Future<int> deleteEmploitemp(Insertable<Emploitemp> row) => delete(emploitemps).delete(row);

  Future<List<Emploitemp>> getEmploitempById(int idPersonn) {
    return (select(emploitemps)
      ..orderBy([
        (t) => OrderingTerm(expression: t.id_jour, mode: OrderingMode.asc)
      ])..where((tbl) => tbl.id_personne_eleve.equals(idPersonn))
    ).get();
  }
}