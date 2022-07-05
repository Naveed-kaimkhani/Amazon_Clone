import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/widget/ResultWidget.dart';
import 'package:ecommerce_app/widget/SearchBarWidget.dart';
import "package:flutter/material.dart";

import '../Models/Product.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: false,
          hasBackButton: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Showing results for ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: query,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            Expanded(
              child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("products").where("ProductName" , isEqualTo: query).get(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: Text("Nothing to show"),);
            else {

           return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3.3,
                ),
                itemBuilder: (context, index) {
                  Product product=Product.fromJson(snapshot.data!.docs[index].data());
                  return ResultsWidget(
                    product:product
                        
                  );
                },
              );
            }
              }
            )     
            )
          ],
        ),
      ),
    );
  }
}
