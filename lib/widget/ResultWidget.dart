
import 'package:ecommerce_app/widget/CostWidget.dart';
import 'package:flutter/material.dart';

import '../Models/Product.dart';
import '../constant/Utils.dart';

class ResultsWidget extends StatelessWidget {
  final Product product;
  const ResultsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils.getScreenSize();
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductScreen(productModel: product),
          
      },    
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 3,
              child: Image.network(
                product.url,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                product.ProductName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CostWidget(color: Colors.grey, cost: 20.00),
          ]
        )
        )
        );
  }
}