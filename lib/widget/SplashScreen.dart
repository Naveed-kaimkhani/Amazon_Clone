import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_app/Onboarding/ScreenOne.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //bool check=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child:Lottie.network('https://assets1.lottiefiles.com/private_files/lf30_x2lzmtdl.json')
          //child: Lottie.asset('assets/images/splash.json'),
      ),
    );
  }
}
