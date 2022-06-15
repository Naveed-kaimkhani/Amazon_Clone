import 'package:ecommerce_app/widget/Acount_screenBar.dart';
import 'package:ecommerce_app/widget/Product_list.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';

import '../constant/Constants.dart';
import '../widget/Account_Intro_Widget.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Account_screenBar(),
      body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
                  const Account_Intro_Widget(),
                  Container(
            height: ScreenUtil().setHeight(40),
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[800],
            ),
            child: GestureDetector(
              child: Center(child: Text("Sign out")),
              onTap: () {
                // Navigator.pushNamed(context, "/account_details");
              },
            ),
                  ),
                  SizedBox(
            height: 10.h,
                  ),
                  Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[800],
            ),
            height: ScreenUtil().setHeight(40),
            width: 100.w,
            child: GestureDetector(
              child: Center(child: Text("sell")),
              onTap: () {
                // Navigator.pushNamed(context, "/account_details");
              },
            ),
                  ),
                  SizedBox(
            height: 10.h,
                  ),
                  Product_list(title: "Your Orders", children: Test),
                  SizedBox(
            height: 10.h,
                  ),
                  Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Order $index"),
                  subtitle: const Text("Black shoe"),
                  trailing: const Icon(Icons.check),
                );
              },
            ),
                  )
                ]),
          )),
    );
  }
}
