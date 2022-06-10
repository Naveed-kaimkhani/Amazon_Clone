import 'package:flutter/material.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inputfields extends StatelessWidget {
  String? hint_text;
  IconData? field_icon;
  TextEditingController? controller;
  inputfields({required this.hint_text, required this.field_icon,required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.w),
        color: globalVariables.secondaryColor.withAlpha(60),
      ),

      // ignore: prefer_const_constructors
      child: TextField(
        controller: controller,
        cursorColor: globalVariables.secondaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint_text,
          icon: Icon(
            field_icon,
            color: globalVariables.secondaryColor,
          ),
        ),
      ),
    );
  }
}
