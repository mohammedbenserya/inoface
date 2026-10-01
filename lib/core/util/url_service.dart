

class UrlService {
  static const String inoserHost = 'inoser-education.com';
  static const String inoserOrigin = 'http://$inoserHost';

  static const loginInface = "login_ws";
  static const enfants = "enfants_ws";
  static const controlenotes_ws = "controlenotes_ws";
  static const mainCount = "main_count_ws";
  static const joursFeries = "jours_feries_ws";
  static const evenements = "evenements_ws";
  static const devoirs = "devoirs_ws";
  static const GET_DEVOIRS_DATES = "GetAllDevoirsByDate_ws";
  static const EVENEMENTS_BY_ID = "EvenementByID_ws";
  static const INFORMATIONS = "informations_ws";
  static const INFORMATIONS_BY_ID = "InformationByID_ws";
  static const FORGIT_PASSWORD = "Forget_password_ws";
  static const QRCODE = "login_with_Qrcode_ws";
  static const GET_URL_QRCODE = "$inoserOrigin/lescopains/json/GetUrlFromQrcode_ws";
  static const AGEND_CONFIG = "agenda_config_ws";
  static const AGEND = "agenda_ws";
  static const AGENDA_DATES = "agenda_dates_ws";
  static const agendaDatesV2Ws = "agenda_dates_v2_ws";
  static const AGENDA_BY_ID = "agenda_byID_ws";
  static const ADD_NOTE = "addnote_ws";
  static const ADD_DEMANDE_ATTESTATION = "add_demandeattestation_ws";
  static const DEMANDE_ATTESTATION = "demandeattestations_ws";
  static const REMOVE_ATTESTATION = "remove_demandeattestation_ws";
  static const PRIVACY = 'https://sites.google.com/view/inoface';

  static const RESERVATIONS_DATE = 'reservationscantinedates_ws';
  static const GET_RESERVATIONS = 'Getreservationcantine_ws';
  static const ADD_RESERVATIONS = 'add_reservationcantine_ws';
  static const REMOVE_RESERVATIONS = 'remove_reservationcantine_ws';
  static const PDF_RESERVATIONS = 'plancantinepdf_ws';
  static const GET_PLANCANTINE_BY_DATE = 'GetPlancantinebydate_ws';
  static const PARENT_NOTIFICATIONS = 'parent_notifications_ws';
  static const PARENT_NOTIFICATIONS_BY_ID = 'parent_notificationbyid_ws';
  static const DEMANDE_RECUPERATION = 'demanderecuperation_ws';
  static const ADD_DEMANDE_RECUPERATION = 'add_demanderecuperation_ws';
  static const REMOVE_DEMANDE_RECUPERATION = 'remove_demanderecuperation_ws';
  static const sondagesWs = 'sondages_ws';
  static const sondageSaveChoicesWs = 'sondage_Save_Choices_ws';
  static const sondageSaveCommentaire = 'sondage_Set_Commentaire_ws';
  static const sondageSetStatut_ws = 'sondage_Set_Statut_ws';
  static const sondageByID_ws = 'sondageByID_ws';

  static const logout = 'logout_ws';

  static String schoolJson(String? codeSchool, String service) {
    return '$inoserOrigin/${codeSchool ?? ''}/json/$service';
  }

  static bool isInoserHost(String? host) {
    if (host == null || host.isEmpty) return false;
    final value = host.toLowerCase();
    return value == inoserHost ||
        value.endsWith('.$inoserHost') ||
        value == 'inoser2.cnrst.ma';
  }

  static String httpFallback(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.host.isEmpty || uri.scheme != 'https') {
      return url;
    }
    if (isInoserHost(uri.host)) {
      return uri.replace(scheme: 'http').toString();
    }
    return url;
  }

  /// Keep Inoser media on a scheme iOS can load (HTTPS when present, else HTTP).
  static String rewriteInoserUri(String url) {
    return url;
  }

  static String? rewriteInoserUriOrNull(String? url) {
    if (url == null || url.isEmpty) {
      return url;
    }
    return rewriteInoserUri(url);
  }
}
