import 'package:ecommerce_app/AppRoutes.dart';
import 'package:ecommerce_app/constant/Utils.dart';
import 'package:ecommerce_app/widget/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constant/globalVariables.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = const Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils.getScreenSize();
    return 
    Container(
      height: 80.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: globalVariables.backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : Container(),
          SizedBox(
            width: screenSize.width * 0.7,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                onSubmitted: (String query) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(query: query)));
                },
                readOnly: isReadOnly,
                onTap: () {
                  if (isReadOnly) {

                    Navigator.of(context).pushNamed(AppRoutes.SearchScreen);
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search Products",
                  fillColor: Colors.white,
                  filled: true,
                  border: border,
                  focusedBorder: border,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic_none_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
