import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/product_contoller.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/card_items..dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/search_from_text.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({Key? key}) : super(key: key);

//   final controller = Get.find<ProductController>();
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 8, 0),
                child: Text(
                  "Find Your",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 3, 8, 5),
                child: Text(
                  "INSPIRATION",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 4, 15, 0),
                child: SearchFormText(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0,
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text("Trending",
        //   style: TextStyle(
        //     fontSize: 20
        //   ),),
        // ),
        CardItems()
      ]),
    ));
  }
}
