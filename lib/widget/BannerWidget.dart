import 'package:ecommerce_app/constant/Constants.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int CurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (CurrentIndex == (largeAds.length - 1)) {
          setState(() {
            CurrentIndex = -1;
          });
        }
        setState(() {
          CurrentIndex++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            largeAds[CurrentIndex],
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  globalVariables.backgroundColor,
                  globalVariables.backgroundColor.withOpacity(0),
                ])),
          )
        ],
      ),
    );
  }
}
