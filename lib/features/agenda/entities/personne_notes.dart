import 'package:inoface/core/database/app_database.dart';
// import 'package:drift/drift.dart';
import 'package:moor/moor.dart';

part 'personne_notes.g.dart';

class PersonneNotes extends Table {
  IntColumn get id_personne => integer()();
  TextColumn get nom => text().nullable()();
  TextColumn get prenom => text().nullable()();
  IntColumn get id_agenda_note => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id_agenda_note};
}

// @DriftAccessor(tables: [PersonneNotes])
@UseDao(tables: [PersonneNotes])
class PersonneNotesDao extends DatabaseAccessor<AppDatabase> with _$PersonneNotesDaoMixin {
  final AppDatabase db;
  PersonneNotesDao(this.db) : super(db);

  Stream<List<PersonneNote>> watchAllPersonneNote() => select(personneNotes).watch();
  Future<List<PersonneNote>> getAllPersonneNote() => select(personneNotes).get();

  Future<void> insertAllPersonneNote(List<Insertable<PersonneNote>> rows) =>
      batch((batch) => batch.insertAll(personneNotes, rows, mode: InsertMode.replace));
  Future insertPersonneNote(Insertable<PersonneNote> row) => into(personneNotes).insert(row, mode: InsertMode.replace);
  Future updatePersonneNote(Insertable<PersonneNote> row) => update(personneNotes).replace(row);
  Future deletePersonneNote(Insertable<PersonneNote> row) => delete(personneNotes).delete(row);

  Stream<List<PersonneNote>> watchAllPersonneNoteById(int id) {
    return (select(personneNotes)..where((t) => t.id_personne.equals(id))).watch();
  }

  Future<PersonneNote?> getAllPersonneNoteById(int idAgendaNote) {
    return (select(personneNotes)..where((t) => t.id_agenda_note.equals(idAgendaNote))).getSingleOrNull();
  }
}
