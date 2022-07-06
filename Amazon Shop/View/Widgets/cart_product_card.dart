import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/cart_controller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Model/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;
  CartProductCard(
      {Key? key,
      required this.productModels,
      required this.index,
      required this.quantity})
      : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.green.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 2)
              ]),
          child: Row(
            children: [
              Container(
                width: 88,
                child: Image(
                  image: NetworkImage(productModels.image),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 25, 5, 10),
                      child: Container(
                        child: Text(
                          productModels.title,
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Text(
                        "\$${productModels.price}",
                        //"\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.removeProductsFromCart(productModels);
                          },
                          icon: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 12,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        Text(
                          "$quantity",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.addProductToCart(productModels);
                          },
                          icon: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 12,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.removeOneProduct(productModels);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
