
import 'package:flutter/material.dart';

import '../Models/Product.dart';

class ProductItem extends StatelessWidget {
final Product product;
  const ProductItem({
    Key? key,required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      height: 220,
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 25,
                width: 45,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 91, 218),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  product.discount.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.red,
                size: 30,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Image.network(
             product.url,
              height: 80,
              width: 80,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              product.ProductName,
              //textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
                product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              //textAlign: TextAlign.start,
              style: TextStyle(fontSize: 10),
            ),
          ),
          SizedBox(height: 3),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              product.price.toString(),
              //maxLines: 2,
              overflow: TextOverflow.ellipsis,
              //textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
