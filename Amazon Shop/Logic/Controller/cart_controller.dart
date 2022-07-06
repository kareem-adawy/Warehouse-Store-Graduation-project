import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Model/product_model.dart';
import 'package:mansour_udemy/Amazon%20Shop/routes/routes.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: "Clear Products",
        titleStyle: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        middleText: "Are You Sure You Want To Clear Cart?",
        middleTextStyle: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        radius: 10,
        buttonColor: Colors.green,
        textCancel: "NO",
        cancelTextColor: Colors.black,
        onCancel: () {
          Get.toNamed(Routes.CartScreen);
        },
        textConfirm: "Yes",
        confirmTextColor: Colors.black,
        onConfirm: () {
          productsMap.clear();
          Get.back();
        });
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price = e.value).toList();
  get total => productsMap.entries
      .map((e) => e.key.price = e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
