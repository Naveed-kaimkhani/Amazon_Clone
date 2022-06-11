import 'package:ecommerce_app/widget/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton:true),
    );
  }
}