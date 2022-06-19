import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';

import '../Models/Product.dart';
import 'CustomSquareButton.dart';

class Cart_Item_Card extends StatelessWidget {
  final Product product;
  const Cart_Item_Card({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: ScreenUtil().setWidth(70),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: globalVariables.greyBackgroundCOlor,
              ),
              child: Image.network(
                 product.url,),
            ),
          ),
        ),
      ),
      SizedBox(
        width: ScreenUtil().setWidth(250),
        child: ListTile(
          title: Text(
          product.ProductName,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              //fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          subtitle: Column(
            children: [
              Row(
                children:  [
                  Text(product.price.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      )),
                  Text(
                    "  x2",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    CustomSquareButton(
                        child: Icon(Icons.remove),
                        onPressed: () {},
                        color: Colors.grey[200]!,
                        dimension: 23),
                    CustomSquareButton(
                        child: Text("0"),
                        onPressed: () {},
                        color: Colors.grey[200]!,
                        dimension: 23),
                    CustomSquareButton(
                        child: Icon(Icons.add),
                        onPressed: () {},
                        color: Colors.grey[200]!,
                        dimension: 23),
                  ],
                ),
              )
            ],
          ),
        ),
        // trailing: Text("100"),
      ),
    ]);
  }
}
