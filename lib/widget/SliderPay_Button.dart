import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SliderPay_Button extends StatelessWidget {
  const SliderPay_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalVariables;
    return SlideAction(
      borderRadius: 12,
      innerColor: Color.fromARGB(255, 8, 92, 160),
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
      onSubmit: () {
        //  print("slide to checkout");
      },
    );
  }
}
