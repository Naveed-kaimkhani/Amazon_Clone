import 'package:ecommerce_app/Screens/ProductScreen.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Product.dart';

class SimpleProductWidget extends StatelessWidget {
  final String url;
  final Product product;
  SimpleProductWidget({Key? key, required this.url, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(product: product)),
          )),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8.r),
          child: Image.network(url),
        ),
      ),
    );
  }
}
