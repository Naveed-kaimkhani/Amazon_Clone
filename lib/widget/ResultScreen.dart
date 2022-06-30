import 'package:ecommerce_app/widget/ResultWidget.dart';
import 'package:ecommerce_app/widget/SearchBarWidget.dart';
import "package:flutter/material.dart";

import '../Models/Product.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: false,
          hasBackButton: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Showing results for ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: query,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            Expanded(
              child: GridView.builder(
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return ResultsWidget(
                    product: Product(
                        ProductName: "Hand Bag",
                        description: "This is a Shopping Online App that builds only five main things first, it is the home page. and the second one is the store page. and the third one is the account page, and the fourth one is the cart page. and the last one is more pages",
                        url:
                            "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                        price: 1000,
                        discount: 30.0,
                        rating: 1,
                        SellerName: "meee",
                        uid: "Me hunn",
                        Sellerid: "20sw",
                        NoOfRatings: 0,
                  //      color: Color.fromARGB(255, 1, 45, 81),
                        Category:"Sports",
                        ),
                        
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
