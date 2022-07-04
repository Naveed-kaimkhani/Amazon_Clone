import 'package:ecommerce_app/resources/Firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../Provider/UserDetailsProvider.dart';

class SliderPay_Button extends StatelessWidget {
 // Future? SubmitFunction;
  SliderPay_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      borderRadius: 12,
      innerColor: Color.fromARGB(255, 11, 124, 217),
      outerColor: Colors.blue,
      sliderButtonIcon: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.white,
      ),
      text: "Slide to pay",
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        //fontWeight: FontWeight.bold,
      ),
      sliderRotate: false,
      onSubmit:()async{
            await Firestore_method.BuyProductFromCart(user: Provider.of<UserDetailsProvider>(context,listen: false).userDetails);
      },
    );
  }
}
