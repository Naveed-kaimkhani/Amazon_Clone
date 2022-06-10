import 'package:ecommerce_app/widget/SearchAppBar.dart';
import "package:flutter/material.dart";

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
