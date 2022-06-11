import 'package:ecommerce_app/constant/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category_list extends StatelessWidget {
  const Category_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(categoryLogos[index]),
                    ),
                    Text(categoriesList[index]),
                  ],
                );
              })),
    );
  }
}
