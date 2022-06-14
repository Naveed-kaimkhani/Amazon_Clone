import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/Models/User_Details.dart';
import 'package:ecommerce_app/Screens/Acount_Screen.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:ecommerce_app/widget/BannerWidget.dart';
import 'package:ecommerce_app/widget/Category_list.dart';
import 'package:ecommerce_app/widget/Product_list.dart';
import 'package:ecommerce_app/widget/SearchBarWidget.dart';
import 'package:ecommerce_app/widget/SimpleProductWidget.dart';
import 'package:ecommerce_app/widget/UserDetailsBar.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  bool isReadOnly = true;
  bool hasBackButton = false;
  double offset = 0;
  ScrollController _scrollController = ScrollController();

  List<Widget> Test = [
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
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

  //@override
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SearchBarWidget(isReadOnly: true, hasBackButton: false),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Category_list(),
                    BannerWidget(),
                    // SizedBox(
                    //   height: 3.h,
                    // ),
                    Product_list(title: "Upto 70% Off", children: Test),
                    Product_list(title: "Upto 50% Off", children: Test),
                    Product_list(title: "Upto free Off", children: Test),
                  ],
                ),
              ),
              UserDetailsBar(
                  offset: offset,
                  userDetails:
                      User_Details(name: "Naveed", address: "KK house")),
            ],
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
                    Navigator.of(context).pushNamed(AppRoutes.AccountScreen);
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
