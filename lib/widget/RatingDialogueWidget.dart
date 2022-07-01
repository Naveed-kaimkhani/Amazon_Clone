
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Models/ReviewModel.dart';
import 'package:ecommerce_app/Provider/UserDetailsProvider.dart';
import 'package:ecommerce_app/resources/Firestore_methods.dart';
import 'package:ecommerce_app/widget/UserDetailsBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingDialogueWidget extends StatelessWidget {
 final String productuid;

   const RatingDialogueWidget({
    Key? key,required this.productuid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 Firestore_method firestore_method=Firestore_method();
    return RatingDialog(
      title: const Text(
        'Drop a review for this product',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          //    fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      //image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Type here',
      onCancelled: () => print('cancelled'),
      onSubmitted: (RatingDialogResponse res) {
          firestore_method.UploadReview(
            review: ReviewModel(senderName: Provider.of<UserDetailsProvider>(context,listen: false).userDetails!.name??"UnKnown", description: res.comment, rating: res.rating.toInt()), 
            uid: productuid);
      },
    );
  }
}
