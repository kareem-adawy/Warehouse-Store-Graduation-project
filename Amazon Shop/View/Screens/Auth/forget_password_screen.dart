import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/auth_contoller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Utils/my_string.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Padding(
          padding: const EdgeInsets.all(60),
          child: Text(
            "Forgot Password",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    "If You Want To Recover Your Account, Then Please Provide Your Email ID Below"),
              ),
              Image.asset("images/forgot password.png"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: emailController,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value!)) {
                      return "Invalid email";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.green.shade900,
                      ),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GetBuilder<AuthController>(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String email = emailController.text.trim();
                      controller.resetPassword(email);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade600,
                    padding:
                        EdgeInsets.symmetric(horizontal: 156, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.green.shade900)),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  child: Text("SEND"),
                );
              }),
            ],
          ),
        ),
      ),
    ));
  }
}
