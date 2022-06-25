import 'package:ecommerce_app/resources/Firestore_methods.dart';
import 'package:flutter/cupertino.dart';

import '../Models/User_Details.dart';

class UserDetailsProvider with ChangeNotifier{
  User_Details? userDetails;
  UserDetailsProvider():userDetails=User_Details(name: "Loading", phone: "Loading");

  Future getData() async {
    userDetails = await Firestore_method().getNameAndAddress();
    notifyListeners();
  }
  
}