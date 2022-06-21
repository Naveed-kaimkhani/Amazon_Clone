import 'package:ecommerce_app/widget/Add_removeItemButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Models/Product.dart';
import '../constant/Utils.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils.getScreenSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: product.color,
          leading: Container(
            margin: const EdgeInsets.all(15.0),
            child: SvgPicture.asset('assets/images/back.svg'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 25,
              color: Colors.black,
            ),

            // IconButton(
            //       onPressed: () {},
            //       icon: SvgPicture.asset('assets/images/search.svg')),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26)),
                    ),
                    height: screenSize.height * 0.6,
                    width: screenSize.width,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: (screenSize.width * 0.2),
                              left: (screenSize.width * 0.03)),
                          child: Text(
                            product.description,
                            // maxLines: 6,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 17,
                              //fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.03),
                          child: Row(
                            children: [
                              Add_removeItemButton(
                                  icon: Icons.remove, press: () {}),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  product.price.toString().padLeft(2, "0"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                              Add_removeItemButton(
                                  icon: Icons.add, press: () {}),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.03),
                          height: 50,
                          width: 58,
                          decoration: BoxDecoration(
                              // color: product.color,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: product.color,
                              )),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          product.ProductName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(text: "Price\n"),
                                TextSpan(
                                    text: product.price.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    )),
                              ]),
                            ),
                          ),
                          Expanded(
                            child: Image.network(
                                "http://www.pngall.com/wp-content/uploads/2/Bag-PNG.png"),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
