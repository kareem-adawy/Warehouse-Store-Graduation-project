import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/auth_contoller.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: controller.isCheckBox
                    ? Image.asset("images/check.png")
                    : Container(
                        color: Colors.grey.shade400,
                      ),
              ),
            ),
          ),
          Text(
            " I Accept conditions & terms",
            style: TextStyle(),
          )
        ],
      );
    });
  }
}
