import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/Screens/Acount_Screen.dart';
import 'package:ecommerce_app/Screens/Cart_Screen.dart';
import 'package:ecommerce_app/Screens/Home_Screen.dart';
import 'package:ecommerce_app/Screens/More.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import "package:flutter/material.dart";

class screen_layout extends StatefulWidget {
  const screen_layout({Key? key}) : super(key: key);

  @override
  State<screen_layout> createState() => _screen_layoutState();
}

class _screen_layoutState extends State<screen_layout> {
 int ind=0;
  final screens= const [
    Home_Screen(),
    Cart_Screen(),
    Account_Screen(),
    More(),
  ];

  List<Widget> names = [
    const Icon(
      Icons.home_outlined,
      size: 24.0,
    ),
    const Icon(
      Icons.shopping_cart_outlined,
      size: 24.0,
    ),
    const Icon(
      Icons.account_circle_outlined,
      size: 24.0,
    ),
    const Icon(
      Icons.menu_outlined,
      size: 24.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        //  index:ind;
        // backgroundColor: bluish,
        color: globalVariables.kPrimaryColor,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        items: names,
        onTap: (index) {
          setState(() {
            ind = index;
          });
        },
      ),  
      body: screens[ind],
      );
  }
}
