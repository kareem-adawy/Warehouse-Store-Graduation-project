import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mansour_udemy/Amazon%20Shop/routes/routes.dart';

class welcome_screen extends StatelessWidget {
  const welcome_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "images/woman.webp",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 170,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 170,
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 60,
                      width: 300,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        children: [
                          Text(
                            "WareHouse",
                            style: TextStyle(
                                color: Colors.green.shade600,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " Store",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.LoginScreen);
                    },
                    child: Text("Get Started"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade600,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.green.shade900)),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.SignupScreen);
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
