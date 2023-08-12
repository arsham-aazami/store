import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  //onInt function called immediately after widget allocates the memory
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateconnectivityStatus);
  }

  //
  void _updateconnectivityStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text("Please connect to the internet"),
        icon: Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_rounded),
        duration: Duration(days: 1),
        backgroundColor: Consts.colorStyleOne,
        snackStyle: SnackStyle.GROUNDED,
        margin: EdgeInsets.all(0),
      );
    } else {
      if (Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
    }
  }
}
