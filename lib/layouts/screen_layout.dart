// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:ecommerce_app/AppRoutes.dart';
// import 'package:ecommerce_app/constant/globalVariables.dart';
// import "package:flutter/material.dart";

// class screen_layout extends StatefulWidget {
//   const screen_layout({Key? key}) : super(key: key);

//   @override
//   State<screen_layout> createState() => _screen_layoutState();
// }

// class _screen_layoutState extends State<screen_layout> {
//   List<Widget> names = [
//     const Icon(
//       Icons.home_outlined,
//       size: 24.0,
//     ),
//     const Icon(
//       Icons.shopping_cart_outlined,
//       size: 24.0,
//     ),
//     const Icon(
//       Icons.account_circle_outlined,
//       size: 24.0,
//     ),
//     const Icon(
//       Icons.menu_outlined,
//       size: 24.0,
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 60,
//         //  index:ind;
//         // backgroundColor: bluish,
//         color: globalVariables.kPrimaryColor,
//         buttonBackgroundColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
//         items: names,
//         onTap: (index) {
//           if (index == 0) {
//             setState(() {
//               Navigator.of(context).pushNamed(AppRoutes.HomeScreen);
//             });
//           }
//           if (index == 1) {
//             setState(() {
//               Navigator.of(context).pushNamed(AppRoutes.HomeScreen);
//             });
//           }
//           if (index == 3) {
//             setState(() {});
//           }
//           if (index == 4) {
//             setState(() {});
//           }
//         },
//       ),
//     );
//   }
// }
