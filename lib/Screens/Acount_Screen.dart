import 'package:ecommerce_app/widget/Acount_screenBar.dart';
import "package:flutter/material.dart";

class Account_Screen extends StatefulWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Account_screenBar(),
    );
  }
}