import 'dart:typed_data';

import 'package:ecommerce_app/constant/Utils.dart';
import 'package:ecommerce_app/constant/inputfields.dart';
import 'package:ecommerce_app/widget/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';

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
  final TextEditingController _CostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                              controller: _nameController),
                          size,
                          inputfields(
                              hint_text: "Price",
                              field_icon: Icons.production_quantity_limits,
                              controller: _nameController),
                          size,
                          inputfields(
                              hint_text: "Discount",
                              field_icon: Icons.production_quantity_limits,
                              controller: _nameController),
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
                                onTap: () async {},
                              )),
                        ]),
                  ),
                ),
              ),
            ),
    ));
  }
}
