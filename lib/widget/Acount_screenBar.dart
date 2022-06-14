import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';

class Account_screenBar extends StatelessWidget with PreferredSizeWidget {
  const Account_screenBar({Key? key})
      : preferredSize = const Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: globalVariables.backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            "Hello, Naveed",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          )
        ]));
  }
}
