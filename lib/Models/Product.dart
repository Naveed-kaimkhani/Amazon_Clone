
import 'package:flutter/material.dart';

class Product{

  final String ProductName;
  final String description;
  final String url;
  final double price;
  final double discount;
  final int rating;
  final String SellerName;
  final String uid;
  final String Sellerid;
  final int NoOfRatings;
  final Color color;
  
  
  Product({required this.ProductName,required this.description,required this.url,required this.price,required this.discount,required this.rating,required this.SellerName,required this.uid,required this.Sellerid,required this.NoOfRatings,required this.color});
    Map<String, dynamic> getJson() {
    return {
      'url': url,
      'ProductName': ProductName,
      'cost': price,
      'discount': discount,
      'uid': uid,
      'sellerName': SellerName,
      'sellerUid':uid,
      'rating': rating,
      'noOfRating': NoOfRatings,
    };
  }
}