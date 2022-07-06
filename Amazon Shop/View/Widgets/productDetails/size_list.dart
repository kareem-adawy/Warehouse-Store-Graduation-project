import 'package:flutter/material.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ["S", "M", "L", "XL", "XXl"];

  var currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: currentSelected == index
                    ? Colors.greenAccent
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 2,
                ),
              ),
              child: Text(
                sizeList[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: sizeList.length,
      ),
    );
  }
}
