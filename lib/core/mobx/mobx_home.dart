import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/util/static.dart';
import '../../features/agenda/models/agenda_model.dart';
import 'package:mobx/mobx.dart';

part 'mobx_home.g.dart';

class MobxHome = MobxHomeBase with _$MobxHome;

abstract class MobxHomeBase with Store {

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
    Static.currentIndex = index;
  }

  @observable
  bool agenda = false;

  @observable
  bool devoir = false;

  @observable
  int index = 0;

  @action
  setIndex(int val) => index = val;

  @observable
  ObservableList<AgendaPhotoDetailModel> photos = ObservableList<AgendaPhotoDetailModel>();

  @action
  void addAllAgendaPhotos(List<dynamic> photos) {
    for (AgendaPhotoDetail photo in photos) {
      this.photos.add(AgendaPhotoDetailModel(
          idAgenda: photo.id_agenda,
          nomOriginalPhoto: photo.nom_original_photo,
          lieuPhoto: photo.lieu_photo,
          position: photo.position,
          idAgendaPhotoDetail: photo.id_agenda_photo_detail));
    }
  }
}
