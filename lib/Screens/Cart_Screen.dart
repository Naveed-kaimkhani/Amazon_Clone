import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:ecommerce_app/widget/CheckoutCard.dart';
import 'package:ecommerce_app/widget/CustomSquareButton.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({Key? key}) : super(key: key);

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CheckoutCard(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
              child: Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          )),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    // cartList.removeAt(index);
                  });
                },
                key: Key("1"),
                background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.delete_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    )),
                child: const Cart_Item_Card()),
          );
        }));
  }
}

class Cart_Item_Card extends StatelessWidget {
  const Cart_Item_Card({
    Key? key,
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
                  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
            ),
          ),
        ),
      ),
      SizedBox(
        width: ScreenUtil().setWidth(250),
        child: ListTile(
          title: Text(
            "Product Name",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              //fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          subtitle: Column(
            children: [
              Row(
                children: const [
                  Text("price",
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
