import 'package:ecommerce_app/constant/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  // final double AppBarHeight=80.0;

  SearchAppBar({Key? key})
      : PreferredSize = const Size.fromHeight(80.0),
        super(key: key);
  @override
  final Size PreferredSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: globalVariables.backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  //@override
  // TODO: implement preferredSi
  }
