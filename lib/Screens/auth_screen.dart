import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:ecommerce_app/constant/inputfields.dart';
import 'package:ecommerce_app/resources/authentication_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/Utils.dart';

class auth_screen extends StatefulWidget {
  const auth_screen({Key? key}) : super(key: key);

  @override
  State<auth_screen> createState() => _auth_screenState();
}

class _auth_screenState extends State<auth_screen>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  AnimationController? _animationController;
  final Duration _animationDuration = const Duration(milliseconds: 250);
  bool? _isLogin = true;
  Animation<double>? containersize;

  //signUp controller
  final TextEditingController _emailControllerSignup = TextEditingController();
  final TextEditingController _passwordControllerSignup =TextEditingController();
  final TextEditingController _nameControllerSignup = TextEditingController();
  final TextEditingController _phoneControllerSignup = TextEditingController();

  //signIn controller
  final TextEditingController _emailControllerSignIn = TextEditingController();
  final TextEditingController _passwordControllerSignIn =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double defaultLoginSize = height - (height * 0.2);
    double defaultRegisterSize = height - (height * 0.1);
    containersize = Tween<double>(begin: height * 0.1, end: defaultRegisterSize)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));

    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Positioned(
          top: 100,
          right: -50,
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: globalVariables.secondaryColor),
          )),

      Positioned(
          top: -50,
          left: -70,
          child: Container(
            width: 180.w,
            height: 180.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                color: globalVariables.secondaryColor),
          )),

      AnimatedOpacity(
        opacity: _isLogin! ? 0.0 : 1.0,
        duration: _animationDuration,
        child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin!;
                    _animationController?.reverse();
                  });
                },
                color: globalVariables.kPrimaryColor,
              ),
            )),
      ),

      //Login Form
      AnimatedOpacity(
        opacity: _isLogin! ? 1.0 : 0.0,
        duration: _animationDuration * 4,
        child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 40.h,
                  // ),
                  Text("Wellcome Back",
                      style: GoogleFonts.acme(
                        fontSize: 25.sp,
                      )),
                  //SizedBox(height: 5.h), //  20*scaleWidth
                  // Image.asset(
                  //   "assets/images/logi.png",
                  //   height: height * 0.6,
                  //   width: width * 0.6,
                  // ),

                  inputfields(
                      hint_text: "Email",
                      field_icon: Icons.email,
                      controller: _emailControllerSignIn),
                  //  sizedBox(height: 10.h),
                  SizedBox(height: 15.h),
                  inputfields(
                      hint_text: "Password",
                      field_icon: Icons.lock,
                      controller: _passwordControllerSignIn),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      width: width * 0.8,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        color: globalVariables.secondaryColor,
                      ),
                      child: GestureDetector(
                        child: const Center(
                            child: Text(
                          "LogIn",
                          style: TextStyle(color: Colors.white),
                        )),
                        onTap:() async {
                           // Future<String> output="something";
                       String output= await authentication_methods.SignInUsers(
                              email: _emailControllerSignIn.text,
                              password: _passwordControllerSignIn.text,
                            );
                          Navigator.of(context).pushNamed(AppRoutes.screenlayout);
                           // print(output);
                        //  Utils.showSnackBar(context: context, content: output.toString());
                          },
                          
                      )),
                  // SizedBox(height: 20.h,)
                ],
              ),
            )),
      ),
      //Registration Form
      // AnimatedBuilder(
      //     animation: _animationController!,
      //     builder: (context, child) {
      //       return buildRegisterForm();
      //     }),
      // Register Container
      AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          if (viewInset == 0 && _isLogin!) {
            return buildRegisterForm();
          } else if (!_isLogin!) {
            return buildRegisterForm();
          }

          // Returning empty container to hide the widget
          return Container();
        },
      ),
      AnimatedOpacity(
        opacity: !_isLogin! ? 1.0 : 0.0,
        duration: _animationDuration * 5,
        child: Visibility(
          visible: !_isLogin!,
          child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 40.h,
                    // ),
                    Text("Wellcome",
                        style: GoogleFonts.acme(
                          fontSize: 25.sp,
                        )),
                    //SizedBox(height: 5.h), //  20*scaleWidth
                    // Image.asset(
                    //   "assets/images/logi.png",
                    //   height: height * 0.6,
                    //   width: width * 0.6,
                    // ),
                    inputfields(
                        hint_text: "Username",
                        field_icon: Icons.person,
                        controller: _nameControllerSignup),
                    SizedBox(height: 15.h),
                    inputfields(
                        hint_text: "Email",
                        field_icon: Icons.email,
                        controller: _emailControllerSignup),
                    //  sizedBox(height: 10.h),
                    SizedBox(height: 15.h),
                    inputfields(
                        hint_text: "Password",
                        field_icon: Icons.lock,
                        controller: _passwordControllerSignup),
                    SizedBox(height: 15.h),

                    inputfields(
                      hint_text: "Phone",
                      field_icon: Icons.contact_phone,
                      controller: _phoneControllerSignup,
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        width: width * 0.8,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          color: globalVariables.secondaryColor,
                        ),
                        child: GestureDetector(
                          child: const Center(
                              child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          )),
                          onTap: () async {
                           // Future<String> output="something";
                       String output= await authentication_methods.SignupUsers(
                              namee: _nameControllerSignup.text,
                              email: _emailControllerSignup.text,
                              phonee: _phoneControllerSignup.text,
                              password: _passwordControllerSignup.text,
                            );
                            // await Firestore_method.uploadDataToFirestore(
                            //   name:_nameControllerSignup.text,
                            //    phone: _phoneControllerSignup.text);
                           // print(output);
                          Utils.showSnackBar(context: context, content: output.toString());
                          },

                          
                        )
                        ),
                    // SizedBox(height: 20.h,)
                  ],
                ),
              )),
        ),
      ),
    ])));
  } 

  Widget buildRegisterForm() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: containersize!.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70.w),
              topRight: Radius.circular(70.w),
            ),
            color: globalVariables.kBackgroundColor,
          ),
          alignment: Alignment.center,
          child: _isLogin!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ",
                        style: GoogleFonts.acme(
                          fontSize: 15.sp,
                        )),
                    GestureDetector(
                        onTap: () {
                          _animationController!.forward();

                          setState(() {
                            _isLogin = !_isLogin!;
                          });
                        },
                        child: const Text(
                          " Sign Up",
                          style: TextStyle(
                              color: globalVariables.secondaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              : Container(),
        ));
  }
}
