import '../../features/account/models/account_model.dart';
import 'package:inoface/core/util/keys.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveUtils {
  static late HiveUtils _hiveUtils;
  static Future<HiveUtils> init() async {
    await Hive.initFlutter();

    await Hive.openBox<dynamic>(Keys.settings);
    await Hive.openBox<dynamic>(Keys.loginInfo);

    //! Adapter
    Hive.registerAdapter(AccountModelAdapter());
    await Hive.openBox<AccountModel>(Keys.accountModel);
    _hiveUtils = HiveUtils();
    return _hiveUtils;
  }
}
