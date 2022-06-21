import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/User_Details.dart';
import '../constant/Utils.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  final User_Details userDetails;
  const UserDetailsBar({
    Key? key,
    required this.offset,
    required this.userDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils.getScreenSize();
    return Positioned(
      top: -offset / 5,
      child: Container(
        height: 20.h,
        width: screenSize.width,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: globalVariables.backgroundGradient,
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //   ),
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Text(
                  "Deliver to ${userDetails.name} - ${userDetails.address} ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
