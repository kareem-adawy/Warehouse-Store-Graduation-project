import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/auth_contoller.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/SettingDetails/ProfileSetting.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/SettingDetails/language_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      ProfileWidget(),
      Container(
        color: Colors.black,
        width: 360,
        height: 1,
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: LanguageWidget(),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(18, 5, 18, 0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Country".tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(18, 23, 18, 0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GetBuilder<AuthController>(
              builder: (controller) {
                return InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: "Logout From App",
                        titleStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        middleText: "Are You Sure You Want To Log Out?",
                        middleTextStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        backgroundColor: Colors.grey,
                        radius: 10,
                        buttonColor: Colors.green,
                        textCancel: "NO",
                        cancelTextColor: Colors.black,
                        onCancel: () {
                          Get.back();
                        },
                        textConfirm: "Yes",
                        confirmTextColor: Colors.black,
                        onConfirm: () {
                          controller.signOutFromApp();
                        });
                  },
                  child: Text(
                    "Logout".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    ]));
  }
}
