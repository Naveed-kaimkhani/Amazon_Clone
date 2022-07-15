
import 'package:ecommerce_app/Onboarding/ScreenOne.dart';
import 'package:ecommerce_app/Provider/UserDetailsProvider.dart';
import 'package:ecommerce_app/Screens/Home_Screen.dart';
import 'package:ecommerce_app/Screens/auth_screen.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppRoutes.dart';
import 'Screens/SecondHomeScreen/HomeScreen.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences =await SharedPreferences.getInstance();
  initScreen=preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);

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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_)=>UserDetailsProvider()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'E-Shop',
                theme: ThemeData(
                  colorScheme: const ColorScheme.light(
                    primary: globalVariables.secondaryColor,
                  ),
                  scaffoldBackgroundColor: globalVariables.backgroundColor,
                ),
               
                home:initScreen==0||initScreen==null? StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder:(context,AsyncSnapshot<User?> user){
                   
          if (user.connectionState==ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: globalVariables.kPrimaryColor,
              ),
            );
          }
          else{ 
             return HomeScreen();
          }
          
        } ):HomeScreen(),
                onGenerateRoute: AppRoutes.onGenerateRoute),
          );
        });
  }
}

// Future<Widget>  Navigate() async{
//     bool visitingflag= await getVisitingflag();
//     if (visitingflag==true) {
//       return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
//         builder:(context,AsyncSnapshot<User?> user){
//           if (user.connectionState==ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: globalVariables.kPrimaryColor,
//               ),
//             );
//           }
//           else{ 
//              return HomeScreen();
//           }
          
//         } );
//     }
//   else{
//     return ScreenOne();
//   }
//   }

//  getVisitingflag()async{
//     SharedPreferences preferences =await SharedPreferences.getInstance();
//     bool alreadyVisiting=preferences.getBool("alreadyVisited")??false;
//     return alreadyVisiting;
//   }

//   setVisitingflag()async{
//     SharedPreferences preferences =await SharedPreferences.getInstance();
//     bool alreadyVisiting=await preferences.setBool("alreadyVisited",true);
//     return alreadyVisiting;
//   }


