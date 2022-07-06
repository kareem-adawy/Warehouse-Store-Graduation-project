import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mansour_udemy/Amazon%20Shop/routes/routes.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              "https://www.kindpng.com/picc/m/177-1771772_download-this-high-resolution-shopping-cart-transparent-shopping.png",
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Cart is ",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "Empty ",
            style: TextStyle(
                fontSize: 35,
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Add items to get started ",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.green.shade600,
            borderRadius: BorderRadius.circular(15)),
        child: TextButton(
          onPressed: () {
            Get.toNamed(Routes.MainScreen);
          },
          child: Text(
            "Go To Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      )
    ])));
  }
}
