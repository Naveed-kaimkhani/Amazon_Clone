import 'package:ecommerce_app/constant/Utils.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product_list extends StatelessWidget {
  final String? title;
  final List<Widget>? children;
  const Product_list({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils.getScreenSize();
    return Container(
      margin: const EdgeInsets.all(8),
      color: Color.fromARGB(255, 236, 230, 230),
      height: screenSize.height / 2,
      width: screenSize.width,
      // color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: const Text(
                  "Show more",
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 300,
            
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children!,
            ),
          ),
        ],
      ),
    );
  }
}
