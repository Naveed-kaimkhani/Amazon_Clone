import 'dart:math';
import 'dart:typed_data';

import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {

  Future<Uint8List?> PickImage() async {
      ImagePicker picker=ImagePicker();

      XFile? file= await picker.pickImage(source: ImageSource.gallery);
      return file!.readAsBytes();
    }

  static Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }
String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }
  static showSnackBar(
      {required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: globalVariables.selectedNavBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        content: SizedBox(
          width: getScreenSize().width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
