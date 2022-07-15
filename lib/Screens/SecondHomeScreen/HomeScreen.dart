import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: screensize.height,
        width: screensize.width,
        child: Column(
          children: [
            Padding(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: screensize.height / 2,
                width: screensize.width,
                padding: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 236, 236),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )),
                child: Column(children: [
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
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    height: 220,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 17, 91, 218),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "50%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/bag_5.png",
                            height: 110,
                            width: 110,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Product tile",
                            //textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Descriptionkl ksfjskjf kjkhhkseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeekfjs kljkjk ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            //textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        SizedBox(height: 3),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "50 pkr",
                            //maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            //textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
