import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleProductWidget extends StatelessWidget {
  final String url;
   SimpleProductWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8.r),
        child: Image.network(url),
      ),
    );
  }
}
