import 'package:ecommerce_app/Screens/Home_Screen.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:ecommerce_app/layouts/screen_layout.dart';
import 'package:ecommerce_app/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppRoutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase configuration for web
  if (kIsWeb) {
    //kIswWeb is a boolen variable that is true if the app is running on a web browser
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        //initialize firebase
        options: const FirebaseOptions(
            //initialize firebase options
            apiKey: "AIzaSyCmHobQPlcNTEXXJaWwISL2kef58krLV70", //api key
            authDomain: "ecommerce-app-e5d0c.firebaseapp.com", //auth domain
            projectId: "ecommerce-app-e5d0c", //project id
            storageBucket: "ecommerce-app-e5d0c.appspot.com", //storage bucket
            messagingSenderId: "776872320820", //messaging sender id
            appId: "1:776872320820:web:10582b236b97629a4bcf61" //app id
            ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final auth_screen authIntance = const auth_screen();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'E-Shop',
              theme: ThemeData(
                colorScheme: const ColorScheme.light(
                  primary: globalVariables.secondaryColor,
                ),
                scaffoldBackgroundColor: globalVariables.backgroundColor,
              ),
              // primarySwatch: Colors.blue,
              home: const screen_layout(),
              onGenerateRoute: AppRoutes.onGenerateRoute);
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text("EShop"),
        ),
        body: Column(
          children: [
            const Center(
              child: Text("heEeeeee"),
            ),
            GestureDetector(
              child: const Icon(Icons.search),
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.Search),
            ),
          ],
        ));
    //   initialRoute: AppRoutes.firstpage,
  }
}
