import 'package:mobx/mobx.dart';

part 'mobx_evenement.g.dart';

class MobxEvenement = MobxEvenementBase with _$MobxEvenement;

abstract class MobxEvenementBase with Store {


  @observable
  int currentIndex = 0;

  @action
  void onPageChanged(int index) {
    currentIndex = index;
  }

  @observable
  String title = '';

  @action
  void onTitleChanged(String val) {
    title = val;
  }
}