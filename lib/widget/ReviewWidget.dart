import 'package:ecommerce_app/Models/ReviewModel.dart';
import 'package:ecommerce_app/constant/Utils.dart';
import 'package:ecommerce_app/widget/RatingStateWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReviewWidget extends StatelessWidget {
final  ReviewModel review;
  const ReviewWidget({Key? key,required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils.getScreenSize();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(review.senderName,
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              width:screenSize.width/4,
              child:FittedBox(
                child:RatingStatWidget(rating: review.rating)
              ) ,),
              
            
            
        ],
      ),
    );
  }
}