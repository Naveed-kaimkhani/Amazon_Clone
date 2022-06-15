import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';

class Account_Intro_Widget extends StatelessWidget {
  const Account_Intro_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: globalVariables.backgroundGradient,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.00001),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
      ),
    );
  }
}
