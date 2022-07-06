import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/cart_controller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/product_contoller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Model/product_model.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/product_details_screen.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.green.shade600,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Image.asset("images/search_empry_light.png")
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return BuildCardItems(
                        image: controller.productList[index].image,
                        price: controller.productList[index].price,
                        rate: controller.productList[index].rating.rate,
                        productId: controller.productList[index].id,
                        productModels: controller.productList[index],
                        onTap: () {
                          Get.to(() => ProductDetailScreen(
                                productModels: controller.productList[index],
                              ));
                        },
                      );
                    } else {
                      return BuildCardItems(
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rate: controller.searchList[index].rating.rate,
                          productId: controller.searchList[index].id,
                          productModels: controller.searchList[index],
                          onTap: () {
                            Get.to(() => ProductDetailScreen(
                                  productModels: controller.searchList[index],
                                ));
                          });
                    }
                  }),
        );
      }
    });
  }

  Widget BuildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 2)
              ]),
          child: Column(
            children: [
              Obx(
                () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.manageFavourites(productId);
                          },
                          icon: controller.isFavourites(productId)
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                )),

                      //   Badge(
                      // position: BadgePosition.topEnd(top: 0, end: 3),
                      // animationDuration: Duration(milliseconds: 300),
                      // animationType: BadgeAnimationType.slide,
                      // badgeContent: Text(
                      //   cartController.quantity().toString(),
                      //   // productModels.id
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      // child:   IconButton(
                      //     onPressed: () {
                      //       cartController.addProductToCart(productModels);
                      //     },
                      //     icon: Icon(Icons.shopping_cart)),

                      //   )
                      IconButton(
                          onPressed: () {
                            cartController.addProductToCart(productModels);
                            Get.snackbar("Cart Updated",
                                "The Item Added To Cart Successfully",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.grey,
                                colorText: Colors.black);
                          },
                          icon: Icon(Icons.shopping_cart)),
                    ]),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$$price",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "$rate",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 17,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
