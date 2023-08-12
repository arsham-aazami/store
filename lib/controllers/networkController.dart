import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateconnectivityStatus);
  }

  void _updateconnectivityStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          title: "the internet connection is not available",
          duration: Duration(days: 1),
          backgroundColor: Consts.colorStyleOne,
          snackStyle: SnackStyle.GROUNDED,
          margin: EdgeInsets.all(0));
    }else{
      Get.back();
    }
  }
}
