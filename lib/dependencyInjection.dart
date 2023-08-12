import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/controllers/networkController.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
