import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Controller/cart_controller.dart';
import 'package:mansour_udemy/Amazon%20Shop/Utils/Theme.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/productDetails/color_picker.dart';
import 'package:mansour_udemy/Amazon%20Shop/routes/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  ImageSliders({required this.imageUrl, Key? key}) : super(key: key);

  // final controller = Get.put(ProductController());
  // final cartController = Get.put(CartController());

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor2,
    kCOlor3,
    kCOlor4,
  ];
  int currentPage = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enableInfiniteScroll: false,
                autoPlayInterval: const Duration(seconds: 2),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index;
                  });
                }),
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(25)),
              );
            },
          ),
          Positioned(
              bottom: 30,
              left: 180,
              child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.greenAccent,
                    dotColor: Colors.black),
              )),
          Positioned(
              bottom: 30,
              right: 30,
              child: Container(
                height: 215,
                width: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: ColorPicker(
                            outerBorder: currentColor == index,
                            color: colorSelected[index]),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 3),
                    itemCount: colorSelected.length),
              )),
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 25,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Obx(() => Badge(
                      position: BadgePosition.topEnd(top: -10, end: -10),
                      animationDuration: Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        cartController.quantity().toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: InkWell(
                        onTap: () {
                          //cartController.addProductToCart(productModels);
                          Get.toNamed(Routes.CartScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
