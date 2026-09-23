import 'package:inoface/features/reservations/domain/entities/reservations_cantine_dates.dart';
import 'package:inoface/features/reservations/domain/entities/reservations_cantines.dart';
import 'package:inoface/features/attestations/entities/remove_demandes_attestations.dart';
import 'package:inoface/features/attestations/entities/eleve_attestation_scolaires.dart';
import 'package:inoface/features/attestations/entities/demandes_attestations.dart';
import 'package:inoface/features/DemandeRecuperation/entities/recuperations.dart';
import 'package:inoface/features/reservations/domain/entities/plan_cantines.dart';
import 'package:inoface/features/agenda/entities/agenda_types_prestations.dart';
import 'package:inoface/features/devoir/entities/devoir_piecesjointes.dart';
import 'package:inoface/features/agenda/entities/agenda_photo_details.dart';
import 'package:inoface/features/agenda/entities/agenda_types_details.dart';
import 'package:inoface/features/agenda/entities/personne_enseignants.dart';
import 'package:inoface/features/informations/entities/informations.dart';
import 'package:inoface/features/jours_feries/entities/jours_feries.dart';
import 'package:inoface/features/reservations/domain/entities/plats.dart';
import 'package:inoface/features/evenements/entities/piecesjointes.dart';
import 'package:inoface/features/home/entities/count_notifications.dart';
import 'package:inoface/features/home/entities/count_jours_feries.dart';
import 'package:inoface/features/home/entities/count_informations.dart';
import 'package:inoface/features/evenements/entities/albumphotos.dart';
import 'package:inoface/features/agenda/entities/agenda_details.dart';
import 'package:inoface/features/agenda/entities/personne_notes.dart';
import 'package:inoface/features/evenements/entities/evenements.dart';
import 'package:inoface/features/home/entities/count_evenements.dart';
import 'package:inoface/features/agenda/entities/agenda_dates.dart';
import 'package:inoface/features/agenda/entities/agenda_notes.dart';
import 'package:inoface/features/agenda/entities/agenda_types.dart';
import 'package:inoface/features/home/entities/count_sondages.dart';
import 'package:inoface/features/agenda/entities/add_notes.dart';
import 'package:inoface/features/login/entities/personnes.dart';
import 'package:inoface/features/agenda/entities/agendas.dart';
import 'package:inoface/features/devoir/entities/devoirs.dart';
import 'package:inoface/features/login/entities/enfants.dart';
import '../../features/notification/entities/parent_notifications.dart';
import 'package:inoface/features/login/entities/roles.dart';
import 'package:inoface/core/models/enseignants.dart';
import 'package:inoface/core/models/emploitemps.dart';
import 'package:inoface/core/models/seances.dart';
import 'package:moor_flutter/moor_flutter.dart';
import '../models/counters.dart';
import 'package:moor/moor.dart';
import 'dart:io';



part 'app_database.g.dart';

@UseMoor(
// @DriftDatabase(
    /// All Tables
    tables: [
      Personnes,
      Roles,
      Enfants,
      // MainCounts,
      JoursFeries,
      Evenements,
      Albumphotos,
      Piecesjointes,
      Informations,
      AgendaTypes,
      AgendaTypesDetails,
      AgendaTypesPrestations,
      Agendas,
      PersonneEnseignants,
      AgendaPhotoDetails,
      AgendaNotes,
      PersonneNotes,
      AgendaDetails,
      AddNotes,
      AgendaDates,
      // Views,
      // CountViews,
      EleveAttestationScolaires,
      DemandesAttestations,
      RemoveDemandesAttestations,
      Emploitemps,
      Seances,
      Enseignants,
      ReservationsCantineDates,
      ReservationsCantines,
      PlanCantines,
      Plats,
      Devoirs,
      DevoirPiecesjointes,
      ParentNotifications,
      CountJoursFeries,
      CountNotifications,
      CountInformations,
      CountEvenements,
      Recuperations,
      CountSondages,
      Counters,
      // Accounts,
    ],
    /// All Daos
    // views: [],
    daos: [
      PersonnesDao,
      RolesDao,
      EnfantsDao,
      // MainCountsDao,
      JoursFeriesDao,
      EvenementsDao,
      AlbumphotosDao,
      PiecesjointesDao,
      InformationsDao,
      AgendaTypesDao,
      AgendaTypesDetailsDao,
      AgendaTypesPrestationsDao,
      AgendasDao,
      PersonneEnseignantsDao,
      AgendaPhotoDetailsDao,
      AgendaNotesDao,
      PersonneNotesDao,
      AgendaDetailsDao,
      AddNotesDao,
      AgendaDatesDao,
      // ViewsDao,
      // CountViewsDao,
      EleveAttestationScolairesDao,
      DemandesAttestationsDao,
      RemoveDemandesAttestationsDao,
      EmploitempsDao,
      SeancesDao,
      EnseignantsDao,
      ReservationsCantineDatesDao,
      ReservationsCantinesDao,
      PlanCantinesDao,
      PlatsDao,
      DevoirsDao,
      DevoirPiecesjointesDao,
      ParentNotificationsDao,
      CountJoursFeriesDao,
      CountNotificationsDao,
      CountInformationsDao,
      CountEvenementsDao,
      RecuperationsDao,
      CountSondagesDao,
      CountersDao,
      // AccountsDao,
    ],
    /// All Queries
    queries: {
      // "deleteAllMainCounts": "DELETE FROM main_counts",
      // "deleteAllEnfants": "DELETE FROM enfants",
      // "deleteAllJoursFeries": "DELETE FROM jours_feries",
      // "deleteAllPersonnes": "DELETE FROM personnes",
      // "deleteAllRoles": "DELETE FROM roles",
      // "deleteAllEvenements": "DELETE FROM evenements",
      // "deleteAllInformations": "DELETE FROM informations",
      // "deleteAllAllAlbumphotos": "DELETE FROM albumphotos;",
      // "deleteAllEvenementsByIdPer": "DELETE FROM evenements WHERE id_personne=:idPer;",

      // "deleteAllEleveAttestationScolairesByIdEleve": "DELETE FROM eleve_attestation_scolaires WHERE id_personne_eleve=:idEleve;",
      // "deleteAllDemandesAttestationsByIdEleve": "DELETE FROM demandes_attestations WHERE id_personne_eleve=:idEleve;",
      // "deleteAllRemoveDemandesAttestationsByIdEleveScolaire": "DELETE FROM remove_demandes_attestations WHERE id_eleve_scolaire=:id_eleve_scolaire;",

      // "deleteAllInformationsByIdPer": "DELETE FROM informations WHERE id_personne=:idPer;",
      // "deleteAllAlbumphotosByIdEve": "DELETE FROM albumphotos WHERE id_evenement=:idEve;",
      // "deleteAllPiecesjointes": "DELETE FROM piecesjointes;",
      // "deleteAllPiecesjointesByIdEve": "DELETE FROM piecesjointes WHERE id_evenement=:idEve;",
      // "deleteAllPiecesjointesByIdInfo": "DELETE FROM piecesjointes WHERE id_information=:idInfo;",

      // "deleteAllAgenda": "DELETE FROM agendas",
      // "deleteAllAgendaDetails": "DELETE FROM agenda_details",
      // "deleteAllAgendaNotes": "DELETE FROM agenda_notes",
      // "deleteAllAgendPhotoDetails": "DELETE FROM agenda_photo_details",
      // "deleteAllAgendaTypes": "DELETE FROM agenda_types",
      // "deleteAllAgendaTypesDetails": "DELETE FROM agenda_types_details",
      // "deleteAllAgendaTypesPrestations": "DELETE FROM agenda_types_prestations",
      // "deleteAllPersonneEnseignants": "DELETE FROM personne_enseignants",
      // "deleteAllPersonneNotes": "DELETE FROM personne_notes",
      // "deleteAllAgendaDates": "DELETE FROM agenda_dates",
      // "deleteAllViews": "DELETE FROM views",

      // "deleteDevoir": "DELETE FROM devoirs WHERE id_devoir=:id_devoir;",
      // "deleteDevoirPiecesjointes": "DELETE FROM devoir_piecesjointes WHERE id_devoir=:id_devoir;",
    },
)///@singleton
class AppDatabase extends _$AppDatabase {
  // static AppDatabase instance = getx.Get.find();
  // AppDatabase() : super(_openConnection());
  AppDatabase() : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.inoface',
    logStatements: true,
  )));

  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
    onUpgrade: (migrator, from, to) async {
      await customStatement('PRAGMA foreign_keys = OFF');
      if (from == 1) {
        await migrator.drop(emploitemps);
        await migrator.createTable(plats);
        await migrator.createTable(planCantines);
        await migrator.addColumn(agendaPhotoDetails, agendaPhotoDetails.id_personne);

        await migrator.createTable(emploitemps);
        await migrator.addColumn(seances, seances.id_personne_eleve);
      }

      if (from == 2) {
        await migrator.createTable(devoirs);
        await migrator.createTable(devoirPiecesjointes);
        await migrator.createTable(parentNotifications);
        await migrator.createTable(countNotifications);
        await migrator.createTable(countJoursFeries);
        await migrator.createTable(countInformations);
        await migrator.createTable(countEvenements);
      }

      if (from == 3) {
        await migrator.createTable(recuperations);
      }

      if (from == 4 && Platform.isAndroid) {
        await migrator.addColumn(enfants, enfants.has_cantine);
      } else if (from == 4 && Platform.isIOS) {
        await migrator.addColumn(enfants, enfants.has_cantine);
        await migrator.createTable(countSondages);
        await migrator.addColumn(plats, plats.position);
        await migrator.addColumn(agendaDates, agendaDates.has_photo);
        await migrator.addColumn(agendaDates, agendaDates.nbr_photo);
        await migrator.addColumn(agendaDetails, agendaDetails.position);

        // New
        await migrator.createTable(counters);
      }

      if (from == 5 && Platform.isAndroid) {
        await migrator.alterTable(TableMigration(enfants));
        await migrator.createTable(countSondages);
        await migrator.addColumn(plats, plats.position);
        await migrator.addColumn(agendaDates, agendaDates.has_photo);
        await migrator.addColumn(agendaDates, agendaDates.nbr_photo);
        await migrator.addColumn(agendaDetails, agendaDetails.position);

        // New
        await migrator.createTable(counters);
      }

      if (from == 6) {
        await migrator.addColumn(enfants, enfants.has_ControlesNotes);
      }

      if (from == 7) {
        await migrator.addColumn(personnes, personnes.ecolecode);
      //   await migrator.createTable(accounts);
      //   final currentAcc = await getCashLogin();
      //   if (currentAcc != null && currentAcc.codeSchool != null) {
      //     await into(accounts).insert(Account(
      //       identifiant: currentAcc.identifiant,
      //       motdepasse: currentAcc.motdepasse,
      //       tokenmobile: currentAcc.motdepasse,
      //       codeSchool: currentAcc.codeSchool!,
      //     ));
      //   }
      }

    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  Future<void> deleteAllData() {
    return transaction(() async {
      for (var table in allTables) {
        await delete(table).go();
      }
    });
  }

  //! SINGLETON
  static final AppDatabase _singleton = AppDatabase._internal();
  AppDatabase._internal() : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.prixpad',
    logStatements: true,
  )));

  static AppDatabase get instance => _singleton;

}


// Future<InputLogin?> getCashLogin() async {
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     final codeSchool = prefs.getString(Keys.CODE_SCHOOL);
//     String? data = prefs.getString(Keys.CACHED_LOGIN_INPUT);
//     if (data != null) {
//       final login = inputLoginFromJson(data);
//       return login.copyWith(codeSchool: codeSchool);
//     }
//   } catch (e) {
//     logger.e(e);
//   }
//   return null;
// }

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.prixpad'));
//     return NativeDatabase.createInBackground(file);
//   });
// }