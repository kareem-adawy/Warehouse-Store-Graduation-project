import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/auth_contoller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/setting_controller.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.put(SettingController());
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CircleAvatar(
                  radius: 80,
                  //backgroundImage: AssetImage("images/koko.jpg"),
                  backgroundImage:
                      NetworkImage(authController.displayUserPhoto.value)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //"Kareem Adawy",
                  controller.capitalize(authController.displayUserName.value),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  //"kareeem.adawy@gmail.com",
                  authController.displayUserEmail.value,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ));
  }
}
