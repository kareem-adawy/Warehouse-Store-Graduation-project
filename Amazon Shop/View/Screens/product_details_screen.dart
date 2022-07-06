import 'package:flutter/material.dart';
import 'package:mansour_udemy/Amazon%20Shop/Model/product_model.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/productDetails/add_cart.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/productDetails/clothes_info.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/productDetails/image_slider.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/productDetails/size_list.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailScreen({Key? key, required this.productModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSliders(
              imageUrl: productModels.image,
            ),
            ClothesInfo(
              title: productModels.title,
              productId: productModels.id,
              rate: productModels.rating.rate,
              description: productModels.description,
            ),
            SizeList(),
            AddCart(
              price: productModels.price,
              productModels: productModels,
            )
          ],
        ),
      ),
    );
  }
}
