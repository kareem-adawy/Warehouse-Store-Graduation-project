import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/main_controller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/payment_controller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PayMentController(), permanent: true);
  }

}