import 'package:inoface/core/util/keys.dart';
import 'package:hive/hive.dart';
import 'package:inoface/features/account/models/account_model.dart';


class Boxes {

  static Box<dynamic> settings() => Hive.box<dynamic>(Keys.settings);
  static Box<dynamic> loginInfo() => Hive.box<dynamic>(Keys.loginInfo);

  //! Adapters
  static Box<AccountModel> account() => Hive.box<AccountModel>(Keys.accountModel);

}
