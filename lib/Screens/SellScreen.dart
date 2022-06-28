import 'dart:typed_data';

import 'package:ecommerce_app/Provider/UserDetailsProvider.dart';
import 'package:ecommerce_app/constant/Utils.dart';
import 'package:ecommerce_app/constant/inputfields.dart';
import 'package:ecommerce_app/resources/Firestore_methods.dart';
import 'package:ecommerce_app/widget/LoadingWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  Size screenSize = Utils.getScreenSize();
  final isLoading = false;
  Uint8List? image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _PriceController = TextEditingController();
  final TextEditingController _DiscountController = TextEditingController();
  final categ = [
    'Health and Beauty',
    'Womens Fashion',
    'Mens Fashion',
    'Babies and Toys',
    'Electronics',
    'Sports'
  ];
  String SelectedCateg = 'Health and Beauty';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    SizedBox size = SizedBox(
      height: 20,
    );
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'assets/images/back.svg',
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: isLoading
          ? const LoadingWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          image == null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                          "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                                      IconButton(
                                          onPressed: () async {
                                            Uint8List? _image =
                                                await Utils().PickImage();
                                            if (_image != null) {
                                              setState(() {
                                                image = _image;
                                              });
                                            } else {
                                              print("Image not loaded");
                                            }
                                          },
                                          icon: Icon(Icons.upload)),
                                    ],
                                  ),
                                )
                              : Stack(
                                  children: [
                                    Image.memory(
                                      image!,
                                      height: screenSize.height / 10,
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          Uint8List? _image =
                                              await Utils().PickImage();
                                          if (_image != null) {
                                            setState(() {
                                              image = _image;
                                            });
                                          }
                                          print("Image not loaded");
                                        },
                                        icon: Icon(Icons.upload)),
                                  ],
                                ),
                          size,
                          inputfields(
                              hint_text: "Product Name",
                              field_icon: Icons.production_quantity_limits,
                              controller: _nameController),
                          size,
                          inputfields(
                              hint_text: "Description",
                              field_icon: Icons.production_quantity_limits,
                              controller: _DescriptionController),
                          size,
                          inputfields(
                              hint_text: "Price",
                              field_icon: Icons.production_quantity_limits,
                              controller: _PriceController),
                          size,
                          inputfields(
                              hint_text: "Discount",
                              field_icon: Icons.production_quantity_limits,
                              controller: _DiscountController),
                          size,
                          Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                              ),
                              width: width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.w),
                                color: globalVariables.secondaryColor
                                    .withAlpha(60),
                              ),

                              // ignore: prefer_const_constructors
                              child: SizedBox(
                                //width: 80,
                                child: DropdownButton<String>(
                                  value: SelectedCateg,
                                  items: categ
                                      .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ))
                                      .toList(),
                                  onChanged: (item) => setState(() {
                                    SelectedCateg = item!;
                                  }),
                                ),
                              )),
                          size,
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              width: screenSize.width * 0.8,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.w),
                                color: globalVariables.secondaryColor,
                              ),
                              child: GestureDetector(
                                child: const Center(
                                    child: Text(
                                  "Upload Product",
                                  style: TextStyle(color: Colors.white),
                                )),
                                onTap: () async {
                                  print("in upload function");
                                  Future<String> url =
                                      Firestore_method.uploadImageToDatabase(
                                          image: image, uid: Utils().getUid());
                                  String output = await Firestore_method
                                      .uploadProductToDatabase(
                                    image: image,
                                    productName: _nameController.text,
                                    description: _DescriptionController.text,
                                    rawCost:
                                        double.parse(_PriceController.text),
                                    discount: 20,
                                    sellerName:
                                        Provider.of<UserDetailsProvider>(
                                                    context,
                                                    listen: false)
                                                .userDetails!
                                                .name ??
                                            "No name",
                                    sellerUid:
                                        FirebaseAuth.instance.currentUser!.uid,
                                  );
                                  print("prodcut uploaded");
                                  if (output == "success") {
                                    Utils.showSnackBar(
                                        context: context,
                                        content: "Product Uploaded");
                                    print("Showing snackbar");
                                  } else {
                                    Utils.showSnackBar(
                                        context: context, content: output);
                                    print("Exception aai");
                                  }
                                },
                              )),
                        ]),
                  ),
                ),
              ),
            ),
    ));
  }
}
