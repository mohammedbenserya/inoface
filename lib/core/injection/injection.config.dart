// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i10;

import 'package:cloud_firestore/cloud_firestore.dart' as _i12;
import 'package:firebase_messaging/firebase_messaging.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:inoface/core/injection/register_firebase.dart'
    as _i24;
import 'package:inoface/core/injection/register_module.dart' as _i25;
import 'package:inoface/core/util/hive_utils.dart' as _i14;
import 'package:inoface/features/agenda/bloc/agenda/agenda_bloc.dart'
    as _i3;
import 'package:inoface/features/agenda/bloc/agenda_config/agenda_config_bloc.dart'
    as _i4;
import 'package:inoface/features/attestations/bloc/attestations_bloc.dart'
    as _i5;
import 'package:inoface/features/DemandeRecuperation/bloc/demande_recuperation_bloc.dart'
    as _i8;
import 'package:inoface/features/devoir/bloc/devoir_bloc.dart'
    as _i9;
import 'package:inoface/features/devoir/cubit/date_devoir_cubit.dart'
    as _i7;
import 'package:inoface/features/evenements/bloc/evenements_bloc.dart'
    as _i11;
import 'package:inoface/features/informations/bloc/informations_bloc.dart'
    as _i15;
import 'package:inoface/features/init_home/bloc/init_home_bloc.dart'
    as _i16;
import 'package:inoface/features/jours_feries/bloc/jours_feries_bloc.dart'
    as _i17;
import 'package:inoface/features/login/bloc/login_bloc.dart' as _i18;
import 'package:inoface/features/notification/cubit/notifications_cubit.dart'
    as _i19;
import 'package:inoface/features/reservations/cubit/date/reservation_date_cubit.dart'
    as _i20;
import 'package:inoface/features/reservations/cubit/reservation/reservations_cubit.dart'
    as _i21;
import 'package:inoface/features/survey/cubit/survey_cubit.dart'
    as _i23;
import 'package:shared_preferences/shared_preferences.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final registerFirebase = _$RegisterFirebase();
    gh.factory<_i3.AgendaBloc>(() => _i3.AgendaBloc());
    gh.factory<_i4.AgendaConfigBloc>(() => _i4.AgendaConfigBloc());
    gh.factory<_i5.AttestationsBloc>(() => _i5.AttestationsBloc());
    gh.factory<_i6.Client>(() => registerModule.httpClient);
    gh.factory<_i7.DateDevoirCubit>(() => _i7.DateDevoirCubit());
    gh.factory<_i8.DemandeRecuperationBloc>(
        () => _i8.DemandeRecuperationBloc());
    gh.factory<_i9.DevoirBloc>(() => _i9.DevoirBloc());
    await gh.factoryAsync<_i10.Directory>(
      () => registerModule.directory,
      preResolve: true,
    );
    gh.factory<_i11.EvenementsBloc>(() => _i11.EvenementsBloc());
    gh.factory<_i12.FirebaseFirestore>(() => registerFirebase.firestore);
    gh.factory<_i13.FirebaseMessaging>(
        () => registerFirebase.firebaseMessaging);
    await gh.factoryAsync<_i14.HiveUtils>(
      () => registerModule.hiveUtils,
      preResolve: true,
    );
    gh.factory<_i15.InformationsBloc>(() => _i15.InformationsBloc());
    gh.factory<_i16.InitHomeBloc>(() => _i16.InitHomeBloc());
    gh.factory<_i17.JoursFeriesBloc>(() => _i17.JoursFeriesBloc());
    gh.factory<_i18.LoginBloc>(() => _i18.LoginBloc());
    gh.factory<_i19.NotificationsCubit>(() => _i19.NotificationsCubit());
    gh.factory<_i20.ReservationDateCubit>(() => _i20.ReservationDateCubit());
    gh.factory<_i21.ReservationsCubit>(() => _i21.ReservationsCubit());
    await gh.factoryAsync<_i22.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i23.SurveyCubit>(() => _i23.SurveyCubit());
    return this;
  }
}

class _$RegisterFirebase extends _i24.RegisterFirebase {}

class _$RegisterModule extends _i25.RegisterModule {}
