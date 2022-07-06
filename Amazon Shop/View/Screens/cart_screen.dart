import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/cart_controller.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/cart_product_card.dart';
import 'package:mansour_udemy/Amazon%20Shop/routes/routes.dart';

import 'empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green.shade600,
            title: Center(child: Text("Cart items")),
            actions: [
              // IconButton(
              //     onPressed: () {
              //       Get.back();
              //     },
              //     icon: Icon(Icons.close)),
              IconButton(
                  onPressed: () {
                    controller.clearAllProducts();
                  },
                  icon: Icon(Icons.delete_forever_rounded)),
            ],
          ),
          body: Obx(() {
            if (controller.productsMap.isEmpty) {
              return EmptyCard();
            } else {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard(
                            index: index,
                            quantity:
                                controller.productsMap.values.toList()[index],
                            productModels:
                                controller.productsMap.keys.toList()[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey,
                          thickness: 0,
                        );
                      },
                      itemCount: controller.productsMap.length,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey.shade600),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Text(
                                "\$498.548",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.PayMentScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 0,
                                  primary: Colors.green.shade600),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Check Out",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.shopping_cart)
                                  ])),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ));
            }
          })),
    );
  }
}
