import 'package:ecommerce_app/constant/Utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = Utils.getScreenSize();
    return SafeArea(
      child: Scaffold(
          body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child:SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.circle_sharp,
                  size: 45,
                ),
                //Icon(Icons.circle_sharp, size: 45),
                Icon(Icons.circle_sharp, size: 45),
                Icon(Icons.circle_sharp, size: 45),
                Icon(Icons.circle_sharp, size: 45),
                Icon(Icons.circle_sharp, size: 45),
                Icon(Icons.circle_sharp, size: 45),
                Icon(Icons.circle_sharp, size: 45),
                Icon(Icons.circle_sharp, size: 45),
                // Icon(Icons.circle_sharp, size: 45),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: screenSize.height / 4,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey,
                ),
              ),
            ),
            shimmerlist(),
            shimmerlist(),
            shimmerlist(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //       width: screenSize.width, height: 50, color: Colors.white),
            // ),
          ]),
        ),
      )),
    );
  }
}

class shimmerlist extends StatelessWidget {
  const shimmerlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = Utils.getScreenSize();

    return Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 6.0),
        child: Container(
          width: screenSize.width,
          height: screenSize.height / 4.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: screenSize.height / 7,
                  width: screenSize.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey),
                ),
              );
            },
          ),
        ));
  }
}
