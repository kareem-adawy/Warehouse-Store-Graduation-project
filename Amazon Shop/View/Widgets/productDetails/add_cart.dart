import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/cart_controller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Model/product_model.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  AddCart({Key? key, required this.price, required this.productModels})
      : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    height: 1.5),
              ),
              Text(
                "\$$price",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: Colors.greenAccent),
                onPressed: () {
                  controller.addProductToCart(productModels);
                  Get.snackbar(
                      "Cart Updated", "The Item Added To Cart Successfully",
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.grey,
                      colorText: Colors.black);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_sharp)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
