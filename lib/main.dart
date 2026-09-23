import 'core/controllers/notification/notify_firebase_logic.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'features/init_home/presentation/pages/init_home.dart';
import 'features/informations/logic/informations_logic.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/evenements/logic/evenement_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inoface/widget_helper/splash_app.dart';
import 'core/controllers/language/language_logic.dart';
import 'core/controllers/network/network_logic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/controllers/utils/utils_logic.dart';
import 'features/agenda/logic/agenda_logic.dart';
import 'features/survey/logic/survey_logic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/login/models/input_login.dart';
import 'core/util/generateMaterialColor.dart';
import 'features/login/logic/auth_logic.dart';
import 'core/translation/translation.dart';
import 'core/database/app_database.dart';
import 'features/widgets/intro_app.dart';
import 'package:flutter/material.dart';
import 'core/injection/injection.dart';
import 'core/usecases/constants.dart';
import 'package:get/get.dart';
import 'core/util/keys.dart';



// 1. Create a ProviderContainer
final container = ProviderContainer();
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.instance;
});
// 2. Use it to read the provider
final appDatabase = container.read(databaseProvider);


void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await configureInjection(Env.prod);
  Get.put(NotifyFirebaseLogic(), permanent: true);
  Get.put(NetworkLogic(), permanent: true);
  Get.put(AuthLogic(), permanent: true);
  Get.put(LanguageLogic(), permanent: true);
  Get.put(UtilsLogic(), permanent: true);
  Get.put(AgendaLogic(), permanent: true);
  Get.put(EvenementLogic(), permanent: true);
  Get.put(InformationsLogic(), permanent: true);
  Get.put(SurveyLogic(), permanent: true);
  await initAppService();
  runApp(UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    Locale locale = languageLogic.getLocale();
    bool isFirstRun = prefs.getBool(Keys.intro) ?? true;
    InputLogin? login = authLogic.getCashLogin();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        title: 'Inoface',
        translations: Translation(),
        locale: locale,
        initialRoute: isFirstRun ? '/IntroApp' : (login != null) ? '/InitHome' : '/LoginPage',
        getPages: [
          GetPage(name: '/LoginPage', page: () => const LoginPage()),
          GetPage(name: '/IntroApp', page: () => const IntroApp()),
          GetPage(name: '/InitHome', page: () => const InitHome()),
          GetPage(name: '/SplashApp', page: () => SplashApp(
            child: const InitHome(),
          )),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primaryColor,
          primaryColor: primaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryTextTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            displayLarge: TextStyle(color: Colors.white),
            displayMedium: TextStyle(color: Colors.white),
          ),
          primaryIconTheme: const IconThemeData.fallback().copyWith(
            color: Colors.white,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
