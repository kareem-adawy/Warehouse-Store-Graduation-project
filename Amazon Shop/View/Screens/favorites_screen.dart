import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/product_contoller.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Obx(() {
      if (controller.favouritesList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Icon(
                  Icons.favorite_border,
                  size: 100,
                ),
              ),
              Text(
                "Please Add Your Favorite Products",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      } else {
        return ListView.separated(
            itemBuilder: (context, index) {
              return buildFavItem(
                image: controller.favouritesList[index].image,
                title: controller.favouritesList[index].title,
                price: controller.favouritesList[index].price,
                productId: controller.favouritesList[index].id,
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                thickness: 0,
              );
            },
            itemCount: controller.favouritesList.length);
      }
    })));
  }

  Widget buildFavItem({
    required String image,
    required String title,
    required double price,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 2)
            ]),
        child: Row(
          children: [
            Container(
              width: 88,
              child: Image.network(
                image,
                fit: BoxFit.fill,
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
                        "$title",
                        style: TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "\$$price ",
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.manageFavourites(productId);
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red.shade600,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
