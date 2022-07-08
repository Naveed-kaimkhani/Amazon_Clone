import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'SlandingClipper.dart';

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.5,
                width: size.width,
                child: SvgPicture.asset(
                  "assets/images/last.svg", //asset location
                  // color: Colors.red, //svg color
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height * 0.4,
                    color: globalVariables.kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: size.height * 0.65,
            child: Container(
              width: size.width,
              padding:const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text(
                    'DELIVERY',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                 const Text(
                    'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 8.0 / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                      color: globalVariables.kPrimaryColor),
                ),
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 8.0 / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                      color: globalVariables.kPrimaryColor),
                ),
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 8.0 / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(vertical: 8.0 * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child:const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    bottom: 29,
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.authScreen);
                    },
                    backgroundColor: Colors.white,
                    child:const Icon(
                      Icons.done_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
