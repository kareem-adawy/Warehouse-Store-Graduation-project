import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/auth_contoller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Utils/my_string.dart';
import 'package:mansour_udemy/Amazon%20Shop/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

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
          elevation: 00,
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "LOG",
                      style:
                          TextStyle(fontSize: 36, color: Colors.green.shade900),
                    ),
                    Text(
                      "IN",
                      style: TextStyle(fontSize: 36),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
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
              GetBuilder<AuthController>(
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: passwordController,
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return 'Password should be longer or equal to 6 characters';
                        } else {
                          return null;
                        }
                      },
                      obscureText: controller.isVisibilty ? false : true,
                      keyboardType: TextInputType.visiblePassword,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.ForgetPasswordScreen);
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith(
                              (state) => Colors.grey.shade700)),
                      child: Text("Forgot Password?"))
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GetBuilder<AuthController>(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate())
                      Get.toNamed(Routes.Home_Screen);
                    {
                      String email = emailController.text.trim();
                      String password = passwordController.text;
                      controller.logInUsingFirebase(
                          email: email, password: password);
                      // Get.toNamed(Routes.MainScreen);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade600,
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.green.shade900)),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  child: Text("LOG IN"),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "OR",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {},
                      child: CircleAvatar(child: Image.asset("images/fb.jpg"))),
                  SizedBox(
                    width: 5,
                  ),
                  GetBuilder<AuthController>(builder: (context) {
                    return InkWell(
                        onTap: () {
                          controller.googleSinUpApp();
                        },
                        child: CircleAvatar(
                            child: Image.asset(
                          "images/gogo.jpg",
                          fit: BoxFit.cover,
                        )));
                  }),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
