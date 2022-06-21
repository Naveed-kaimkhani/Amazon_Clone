
import 'package:ecommerce_app/Models/User_Details.dart';
import 'package:ecommerce_app/widget/BannerWidget.dart';
import 'package:ecommerce_app/widget/Category_list.dart';
import 'package:ecommerce_app/widget/Product_list.dart';
import 'package:ecommerce_app/widget/SearchBarWidget.dart';
import 'package:ecommerce_app/widget/UserDetailsBar.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/Constants.dart';

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
        ),
    );
  }
}
