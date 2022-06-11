import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:ecommerce_app/widget/SearchBarWidget.dart';
import "package:flutter/material.dart";

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  bool isReadOnly = true;
  bool hasBackButton = false;

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
    return SafeArea(
      child: Scaffold(
          appBar:SearchBarWidget(isReadOnly: true, hasBackButton:false),
          body: const Center(
            child: Text("Home Screen"),
          ),
          bottomNavigationBar: CurvedNavigationBar(
              //// index: index,
              //backgroundColor:Colors.transparent,
              //  onTap:(index)=>setState(() =>this.index=index),
              height: 60,
              //  index:ind;
              // backgroundColor: bluish,
              color: globalVariables.kPrimaryColor,
              buttonBackgroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              items: names,
              onTap: (index) {
                if (index == 0) {
                  setState(() {
                    Navigator.of(context).pushNamed(AppRoutes.HomeScreen);
                  });
                }
                if (index == 1) {
                  setState(() {
                    Navigator.of(context).pushNamed(AppRoutes.HomeScreen);
                  });
                }
                if (index == 3) {
                  setState(() {});
                }
                if (index == 4) {
                  setState(() {});
                }
              })),
    );
  }
}
