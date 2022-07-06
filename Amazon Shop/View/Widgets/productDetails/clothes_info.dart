import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/product_contoller.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final String description;
  final double rate;
  final int productId;
  ClothesInfo({
    Key? key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: controller.isFavourites(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "$rate",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                initialRating: rate,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
              // RatingBar(
              //   rating: rate,
              //   icon: Icon(
              //     Icons.star,
              //     size: 20,
              //     color: Colors.grey,
              //   ),
              //   starCount: 5,
              //   spacing: 1,
              //   size: 20,
              //   isIndicator: false,
              //   allowHalfRating: true,
              //   onRatingCallback: (value,isIndictor) {
              //     isIndictor.value = true;
              //
              //   },
              //   color: Colors.orangeAccent,
              //
              // )
            ],
          ),
          ReadMoreText(
            description,
            trimLines: 2,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Read more",
            trimExpandedText: "Read less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
