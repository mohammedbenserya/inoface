import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'feedback_mobx.g.dart';

class FeedbackMobx = FeedbackMobxBase with _$FeedbackMobx;

abstract class FeedbackMobxBase with Store {
  @observable
  double selected = 0.0;

  @observable
  bool alert = false;

  @action
  void select(double val) {
    selected = val;
  }

  @action
  void setAlert(bool val) {
    alert = val;
  }

  @observable
  int currentIndex = 0;

  @action
  void onPageChanged(int index) {
    currentIndex = index;
  }

  @observable
  String topic = 'select_title'.tr;

  @action
  void selectTopic(String? val) {
    if (val != null) {
      topic = val;
    }
  }

  @observable
  String search = '';

  @action
  void selectSearch(String topic) => search = topic;
}
