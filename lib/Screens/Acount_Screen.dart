import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/Models/OrderRequestModel.dart';
import 'package:ecommerce_app/resources/Firestore_methods.dart';
import 'package:ecommerce_app/widget/Acount_screenBar.dart';
import 'package:ecommerce_app/widget/Product_list.dart';
import 'package:ecommerce_app/widget/SimpleProductWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';

import '../Models/Product.dart';
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
                Navigator.pushNamed(context, AppRoutes.Sell_Screen);
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("orders")
                  .get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Container();
                else {
                  List<Widget> children = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    Product product =
                        Product.fromJson(snapshot.data!.docs[i].data());
                    children.add(SimpleProductWidget(product: product));
                  }

                  return Product_list(title: "Your Orders", children: children);
                }
              }),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child:StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("OrderRequest")
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: Text("Nothing to show"),);
            else {
           return ListView.builder(
              itemCount:snapshot.data!.docs.length,
              itemBuilder:(context,index){
                OrderRequestModel model=OrderRequestModel.fromJson(snapshot.data!.docs[index].data());
                return ListTile(
                  title: Text(model.name),
                  subtitle: Text(model.address),
                  trailing:  IconButton(onPressed:()async{await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("OrderRequest").doc(snapshot.data!.docs[index].id).delete();},
                   icon: Icon(Icons.check)),
                );
              }
              
              );
            }
              }
            )
          )
        ]),
      )),
    );
  }
}
