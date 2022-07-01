import 'package:ecommerce_app/Models/ReviewModel.dart';
import 'package:ecommerce_app/constant/Utils.dart';
import 'package:ecommerce_app/widget/RatingStateWidget.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewWidget({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils.getScreenSize();
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.senderName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: screenSize.width / 4,
            child: FittedBox(child: RatingStatWidget(rating: review.rating)),
          ),
          Text(
            review.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        const  Divider(
            color: Colors.black,
            height: 15,
            endIndent: 12,
          )
        ],
      ),
    );
  }
}
