import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/auth_contoller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());

  }

}