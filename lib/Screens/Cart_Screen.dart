import 'package:ecommerce_app/Models/Product.dart';
import 'package:ecommerce_app/widget/CheckoutCard.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/Cart_Item_Card.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({
    Key? key,
  }) : super(key: key);

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
                child: Cart_Item_Card(
                  product: Product(
                      ProductName: "shoes",
                      description: "Nikee",
                      url:
                          "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                      price: 10,
                      discount: 30.0,
                      rating: 1.0,
                      SellerName: "meee",
                      uid: "Me hunn",
                      Sellerid: "20sw",
                      NoOfRatings: "kuch nhh",
                      color: Colors.white,
                      ),
                )),
          );
        }));
  }
}
