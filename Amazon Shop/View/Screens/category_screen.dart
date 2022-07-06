import 'package:flutter/material.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Widgets/Category/category%20widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 3, top: 0),
            //     child: Text("Category",
            //     style: TextStyle(
            //       fontSize: 30
            //     ),)
            //   ),
            // ),
            const SizedBox(
              height: 0,
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
