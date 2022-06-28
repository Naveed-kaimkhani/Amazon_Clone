import 'package:ecommerce_app/Screens/Cart_Screen.dart';
import 'package:ecommerce_app/Screens/Home_Screen.dart';
import 'package:ecommerce_app/Screens/Search_Screen.dart';
import 'package:ecommerce_app/layouts/screen_layout.dart';
import 'package:ecommerce_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Acount_Screen.dart';
import 'Screens/SellScreen.dart';



class AppRoutes {
   static const String authScreen = '/auth_screen';
   static const String screenlayout = '/screen_layout';
   static const String HomeScreen= '/Home_Screen';
   static const String SearchScreen= '/Search_Screen';
   static const String AccountScreen= '/Account_Screen';
   static const String CartScreen= '/Cart_Screen';
   //static const String Search= '/Search_Screen';
   static const String SearchResultScreen= '/ResultScreen';
   static const String Produc_Screen= '/ProductScreen';
  static const String Sell_Screen= '/SellScreen';





  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authScreen:
        return _buildRoute(const auth_screen(), settings);      
      // case screenlayout:
      //   return _buildRoute(const screen_layout(), settings);
         case HomeScreen:
        return _buildRoute(const Home_Screen(), settings);
          case SearchScreen:
        return _buildRoute(const Search_Screen(), settings);
          case AccountScreen:
        return _buildRoute(const Account_Screen(), settings);
        case CartScreen:
        return _buildRoute(const Cart_Screen(), settings);
        case Sell_Screen:
       return _buildRoute(const SellScreen(), settings);
       
       case screenlayout:
       return _buildRoute(const screen_layout(), settings);
      default:
        return _buildRoute(const Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}