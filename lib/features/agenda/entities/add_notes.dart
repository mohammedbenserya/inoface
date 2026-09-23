import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'add_notes.g.dart';

class AddNotes extends Table {

  IntColumn get id_agenda_note => integer()();
  IntColumn get id_agenda => integer()();
  IntColumn get id_personne => integer().nullable()();
  TextColumn get note => text()();
  IntColumn get id_agenda_statut => integer().nullable()();
  DateTimeColumn get date_agenda_note => dateTime().nullable()();
  BoolColumn get send => boolean().nullable().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id_agenda_note};

}


// @DriftAccessor(tables: [AddNotes])
@UseDao(tables: [AddNotes])
class AddNotesDao extends DatabaseAccessor<AppDatabase>
    with _$AddNotesDaoMixin {

  final AppDatabase db;
  AddNotesDao(this.db) : super(db);

  Stream<List<AddNote>> watchAllAddNote() => select(addNotes).watch();
  Future<List<AddNote>> getAllAddNote() => select(addNotes).get();

  Future<void> insertAllAddNote(List<Insertable<AddNote>> rows) =>
      batch((batch) => batch.insertAll(addNotes, rows, mode: InsertMode.replace));
  Future insertAddNote(Insertable<AddNote> row) => into(addNotes).insert(row, mode: InsertMode.replace);
  Future updateAddNote(Insertable<AddNote> row) => update(addNotes).replace(row);
  Future deleteAddNote(Insertable<AddNote> row) => delete(addNotes).delete(row);

  Stream<List<AddNote>> watchAllAAddNoteById(int id) {
    return (select(addNotes)
      ..where((t) => t.id_agenda_note.equals(id))).watch();
  }

  Future<List<AddNote>> getAllAddNoteById(int idAgenda) {
    return (select(addNotes)
      ..where((t) => t.id_agenda_note.equals(idAgenda))).get();
  }
}
