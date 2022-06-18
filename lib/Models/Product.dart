import 'package:flutter/material.dart';

class Product{

  final String ProductName;
  final String description;
  final String url;
  final double price;
  final double discount;
  final double rating;
  final int SellerName;
  final String uid;
  final String Sellerid;
  final String NoOfRatings;
  
  Product({required this.ProductName,required this.description,required this.url,required this.price,required this.discount,required this.rating,required this.SellerName,required this.uid,required this.Sellerid,required this.NoOfRatings});

}