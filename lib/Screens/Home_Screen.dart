// import 'package:ecommerce_app/Models/User_Details.dart';
// import 'package:ecommerce_app/Provider/UserDetailsProvider.dart';
// import 'package:ecommerce_app/resources/Firestore_methods.dart';
// import 'package:ecommerce_app/widget/BannerWidget.dart';
// import 'package:ecommerce_app/widget/Category_list.dart';
// import 'package:ecommerce_app/widget/Product_list.dart';
// import 'package:ecommerce_app/widget/SearchBarWidget.dart';
// import 'package:ecommerce_app/widget/ShimmerEffect.dart';
// import "package:flutter/material.dart";
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class Home_Screen extends StatefulWidget {
//   const Home_Screen({Key? key}) : super(key: key);

//   @override
//   State<Home_Screen> createState() => _Home_ScreenState();
// }

// class _Home_ScreenState extends State<Home_Screen> {
//   List<Widget>? Heath;
//   List<Widget>? Womens;
//   List<Widget>? Mens;
//   List<Widget>? Babies;
//   List<Widget>? Elect;
//   List<Widget>? Sports;

//   bool isReadOnly = true;
//   bool hasBackButton = false;
//   double offset = 0;
//   ScrollController _scrollController = ScrollController();
//   Firestore_method firebaseFirestore = Firestore_method();

  // void getData() async {
  //   List<Widget> HeatndBeauty = await Firestore_method.getDataFromCategory(
  //       Category: "Health and Beauty");
  //   List<Widget> WomensFashion =
  //       await Firestore_method.getDataFromCategory(Category: "Womens Fashion");
  //   List<Widget> MensFashion =
  //       await Firestore_method.getDataFromCategory(Category: "Mens Fashion");
  //   List<Widget> Electronicss =
  //       await Firestore_method.getDataFromCategory(Category: "Electronics");
  //   List<Widget> BabiesNdToys =
  //       await Firestore_method.getDataFromCategory(Category: "Babies and Toys");
  //   List<Widget> Sportss =
  //       await Firestore_method.getDataFromCategory(Category: "Sports");

  //   setState(() {
  //     Heath = HeatndBeauty;
  //     Womens = WomensFashion;
  //     Mens = MensFashion;
  //     Elect = Electronicss;
  //     Babies = BabiesNdToys;
  //     Sports = Sportss;
  //   });
  // }

//   //@override
  // @override
  // void initState() {
  //   getData();
  //   // Firestore_method().getNameAndAddress();
  //   super.initState();
  //   _scrollController.addListener(() {
  //     setState(() {
  //       offset = _scrollController.position.pixels;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _scrollController.dispose();
  // }

//   @override
//   Widget build(BuildContext context) {
//     //Provider.of<UserDetailsProvider>(context).getData();
//     Size scrensize = MediaQuery.of(context).size;
//     User_Details? userdetails =
//         Provider.of<UserDetailsProvider>(context).userDetails;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Padding(
//             padding: EdgeInsets.only(
//               left: 18.0,
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.sort,
//                   size: 20,
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 12),
//                   child: Text(
//                     "Shopify",
//                     style: TextStyle(fontSize: 20, color: Colors.black),
//                   ),
//                 ),
//                 //  Spacer(),
//                 //  Icon(Icons.bag)
//               ],
//             ),
//           ),
//         ),
//         // SearchBarWidget(isReadOnly: true, hasBackButton: false),
//         body: Heath != null &&
//                 Womens != null &&
//                 Mens != null &&
//                 Babies != null &&
//                 Sports != null &&
//                 Elect != null
//             ? Stack(
//                 children: [
//                   SingleChildScrollView(
//                     controller: _scrollController,
//                     child: 
//                           Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             const Category_list(),
//                             const BannerWidget(),
//                             // SizedBox(
//                             //   height: 3.h,
//                             // ),
                            // Product_list(
                            //     title: "Health and Beauty", children: Heath),
//                             Product_list(
//                                 title: "Women's Fashion", children: Womens),
//                             Product_list(
//                                 title: "Man's Fashion", children: Mens),
//                             Product_list(
//                                 title: "Babies and Toys", children: Babies),
//                             Product_list(title: "Electronics", children: Elect),
//                             Product_list(title: "Sports", children: Sports),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // UserDetailsBar(
//                   //     offset: offset,
//                   //     userDetails:
//                   //
//                   //      User_Details(name: userdetails!.name, phone:userdetails.phone)),
     
//                 ],
//       ),
//     ),
//               )
//             : ShimmerEffect(),
//       ),
//     );
//   }
// }
