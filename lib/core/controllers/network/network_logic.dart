import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/services.dart';
import '../../usecases/constants.dart';
import 'package:get/get.dart';
import 'network_state.dart';
import 'dart:async';


class NetworkLogic extends GetxController {
  static NetworkLogic instance = Get.find();
  final state = NetworkState();

  late StreamSubscription _streamSubscription;


  @override
  void onInit() {
    _streamSubscription = InternetConnectionChecker.instance.onStatusChange.listen(_updateState);
    super.onInit();
  }

  @override
  void onReady() {
    hasConnection();
    super.onReady();
  }


  Future<void> getConnectionType() async {
    late InternetConnectionStatus result;
    try {
      result = await InternetConnectionChecker.instance.connectionStatus;
    } on PlatformException catch (e) {
      logger.e(e);
    }
    return _updateState(result);
  }

  Future<void> hasConnection() async {
    try {
      state.isConnected = await InternetConnectionChecker.instance.hasConnection;
      update();
      logger.i('Data connection is ${state.isConnected}');
    } on PlatformException catch (e) {
      logger.e(e);
    }
  }

  void _updateState(InternetConnectionStatus status) {
    logger.i('Connection Status: ${status.index}');
    switch (status) {
      case InternetConnectionStatus.connected:
      case InternetConnectionStatus.slow:
        logger.i('Data connection is true');
        state.isConnected = true;
        update();
        break;
      case InternetConnectionStatus.disconnected:
        logger.i('Data connection is false');
        state.isConnected = false;
        update();
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}