import '../../../features/init_home/models/main_counts_model.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import '../../database/app_database.dart';
import 'package:get/get.dart';



class UtilsState {

  //! List Enfant
  RxList<Enfant> enfants = <Enfant>[].obs;

  //! Enfant
  Enfant? enfant;

  //! Version
  late String version;
  String? ignoreNotification;


  //! Main Counts
  late MainCountsModel counters;

  // late DeviceInfoPlugin deviceInfo;

  UtilsState() {
    version = '1.0.0';
    enfant = null;
    // deviceInfo = DeviceInfoPlugin();
    counters = MainCountsModel(
      idPersonne: 0,
      countJoursFeries: 0,
      countNotifications: 0,
      countEvenements: 0,
      countInformations: 0,
      countSondages: 0,
      // idPersonne: 0,
      // erreur: true,
      // message: '',
    );
  }
}
