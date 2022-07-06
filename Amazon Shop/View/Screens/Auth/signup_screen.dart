import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/auth_contoller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Utils/my_string.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/CheckWidget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

//final controller = Get.find<AuthController>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade600,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: fromKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "SIGN",
                        style: TextStyle(
                            fontSize: 40, color: Colors.green.shade900),
                      ),
                      Text(
                        "UP",
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Image.asset("images/app.jpg",
                //     ),
                // ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: nameController,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value!)) {
                        return 'Enter valid name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green.shade900,
                        ),
                        hintText: "User Name",
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: emailController,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value!)) {
                        return 'Invalid email';
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
                  height: 20,
                ),
                GetBuilder<AuthController>(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: passwordController,
                        obscureText: controller.isVisibilty ? false : true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'Password should be longer or equal to 6 characters';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.green.shade900,
                            ),
                            border: OutlineInputBorder()),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CheckWidget(),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<AuthController>(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      if (controller.isCheckBox == false) {
                        Get.snackbar(
                          "Check Box",
                          "Please Accept terms & conditions",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      } else if (fromKey.currentState!.validate()) {
                        String name = nameController.text.trim();
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        controller.signUpUsingFirebase(
                            name: name, email: email, password: password);
                        controller.isCheckBox = true;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade600,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.green.shade900)),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: Text("Sign up"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
