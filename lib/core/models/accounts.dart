// import 'package:inoface/core/database/app_database.dart';
// // import 'package:drift/drift.dart';
// import 'package:moor/moor.dart';
//
// part 'accounts.g.dart';
//
// class Accounts extends Table {
//
//   TextColumn get identifiant => text()();
//   TextColumn get motdepasse => text()();
//   TextColumn get codeSchool => text()();
//   TextColumn get tokenmobile => text().nullable()();
//
//   @override
//   Set<Column> get primaryKey => {identifiant};
//
//
// /*
//     //! this is id_jour = json['id_jour'];
//   //! value of this field is come from json['id_jour'];
//   IntColumn get id_jour_emploitemps => integer()();
//
//   //! this random id
//   IntColumn get id_jour => integer()();
//   IntColumn get id_personne_eleve => integer()();
//   TextColumn get Jour => text().nullable()();
//    */
//
// }
//
// // @DriftAccessor(tables: [Accounts])
// @UseDao(tables: [Accounts])
// class AccountsDao extends DatabaseAccessor<AppDatabase>
//     with _$AccountsDaoMixin {
//
//   final AppDatabase db;
//   AccountsDao(this.db) : super(db);
//
//   Stream<List<Account>> watchAllAccount() => select(accounts).watch();
//   Future<List<Account>> getAllAccount() => select(accounts).get();
//
//   Future<void> insertAllAccount(List<Insertable<Account>> rows) => batch((batch) => batch.insertAll(accounts, rows, mode: InsertMode.replace));
//   Future<int> insertAccount(Insertable<Account> row) => into(accounts).insert(row, mode: InsertMode.replace);
//   Future<bool> updateAccount(Insertable<Account> row) => update(accounts).replace(row);
//   Future<int> deleteAccount(Insertable<Account> row) => delete(accounts).delete(row);
//
//   Future<Account?> getAccountById(String id) {
//     return (select(accounts)
//       ..where((tbl) => tbl.identifiant.equals(id))
//     ).getSingleOrNull();
//   }
//
// }