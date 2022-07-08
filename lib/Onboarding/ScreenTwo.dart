import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ScreenThree.dart';
import 'SlandingClipper.dart';

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: ClipPath(
                    clipper: SlandingClipper(),
                    child: Container(
                      height: size.height * 0.4,
                      color: globalVariables.kPrimaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: size.height * 0.5,
                    width: size.width,
                    child: SvgPicture.asset(
                      "assets/images/second.svg", //asset location
                      // color: Colors.red, //svg color
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.05,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PURCHASE',
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
                    margin: EdgeInsets.symmetric(horizontal: 8.0 / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        shape: BoxShape.circle,
                        color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 9.0),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        shape: BoxShape.circle,
                        color: globalVariables.kBackgroundColor),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
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
              padding: EdgeInsets.symmetric(vertical: 8.0 * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () => print('Skip'),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 18,
                      bottom: 29,
                    ),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.third_Screen);
                      },

                      backgroundColor: Colors.white,
                      //backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.navigate_next_rounded,
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
      ),
    );
  }
}
