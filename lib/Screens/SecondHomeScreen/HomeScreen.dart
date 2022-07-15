import 'package:ecommerce_app/widget/BannerWidget.dart';
import 'package:ecommerce_app/widget/Category_list.dart';
import 'package:ecommerce_app/widget/ShimmerEffect.dart';
import 'package:flutter/material.dart';

import '../../resources/Firestore_methods.dart';
import '../../widget/Product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<Widget>? Heath;
  List<Widget>? Womens;
  List<Widget>? Mens;
  List<Widget>? Babies;
  List<Widget>? Elect;
  List<Widget>? Sports;
 
  bool isReadOnly = true;
  bool hasBackButton = false;
  double offset = 0;
  ScrollController _scrollController = ScrollController();
  Firestore_method firebaseFirestore = Firestore_method();


  void getData() async {
    List<Widget> HeatndBeauty = await Firestore_method.getDataFromCategory(
        Category: "Health and Beauty");
    List<Widget> WomensFashion =
        await Firestore_method.getDataFromCategory(Category: "Womens Fashion");
    List<Widget> MensFashion =
        await Firestore_method.getDataFromCategory(Category: "Mens Fashion");
    List<Widget> Electronicss =
        await Firestore_method.getDataFromCategory(Category: "Electronics");
    List<Widget> BabiesNdToys =
        await Firestore_method.getDataFromCategory(Category: "Babies and Toys");
    List<Widget> Sportss =
        await Firestore_method.getDataFromCategory(Category: "Sports");

    setState(() {
      Heath = HeatndBeauty;
      Womens = WomensFashion;
      Mens = MensFashion;
      Elect = Electronicss;
      Babies = BabiesNdToys;
      Sports = Sportss;
    });
  }
  @override
  void initState() {
    getData();
    // Firestore_method().getNameAndAddress();
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 239, 236, 236),
        body:Heath != null &&
                Womens != null &&
                Mens != null &&
                Babies != null &&
                Sports != null &&
                Elect != null?
         SingleChildScrollView(
          controller: _scrollController,
      child: Column(
        children: [
          NamedAppBar(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: screensize.height,
              width: screensize.width,
              padding: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 236, 236),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child:
                  SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    height: 50,
                    width: screensize.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 50,
                          width: screensize.width - 80,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                            ),
                          ),
                        ),
                        Icon(Icons.mic),
                      ],
                    ),
                                  ),
                                  SizedBox(
                    height: 10,
                                  ),
                                  Category_list(),
                                  SizedBox(
                    height: 5,
                                  ),
                                  BannerWidget(),
                                Product_list(
                                  title: "Health and Beauty", children: Heath),
                                 Product_list(
                               title: "Women's Fashion", children: Womens),
                                    Product_list(
                                title: "Man's Fashion", children: Mens),
                            Product_list(
                                title: "Babies and Toys", children: Babies),
                            Product_list(title: "Electronics", children: Elect),
                            Product_list(title: "Sports", children: Sports),
                                ]),
                  ),
            ),
          )
        ],
      ),
    ):ShimmerEffect(),
    );
  }
}

class NamedAppBar extends StatelessWidget {
  const NamedAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 32),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 35,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "Shopify",
              style: TextStyle(fontSize: 28),
            ),
          ),
          //  Spacer(),
          //  Icon(Icons.bag)
        ],
      ),
    );
  }
}
