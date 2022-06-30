import 'package:flutter/material.dart';

import '../Models/Product.dart';
import '../widget/SimpleProductWidget.dart';

const List<String> categoryLogos = [
  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
];
const List<String> largeAds = [
  "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
];
const List<String> categoriesList = [
  "Prime",
  "Mobiles",
  "Fashion",
  "Electronics",
  "Home",
  "Fresh",
  "Appliances",
  "Books, Toys",
  "Essential"
];

List<Widget> Test = [
  SimpleProductWidget(
  //  url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    product: Product(
      ProductName: "shoes",
      description:
          "What is a Product Description? A product description is a piece of marketing copy that explains the product. It highlights the features and benefits of the product, prompting the visitor to buy it.",
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
      price: 10,
      discount: 30.0,
      rating: 1,
      SellerName: "meee",
      uid: "Me hunn",
      Sellerid: "20sw",
      NoOfRatings: 0,
    //  color: Colors.black,
     Category: "Sports"
    ),
  ),
  SimpleProductWidget(
 //   url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    product: Product(
      ProductName: "shoes",
      description:
          "What is a Product Description? A product description is a piece of marketing copy that explains the product. It highlights the features and benefits of the product, prompting the visitor to buy it.",
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
      price: 10,
      discount: 30.0,
      rating: 1,
      SellerName: "meee",
      uid: "Me hunn",
      Sellerid: "20sw",
      NoOfRatings: 0,
      //color: Colors.black,
     Category: "Sports"
    ),
  ),
  SimpleProductWidget(
 //   url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    product: Product(
      ProductName: "shoes",
      description:
          "What is a Product Description? A product description is a piece of marketing copy that explains the product. It highlights the features and benefits of the product, prompting the visitor to buy it.",
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
      price: 10,
      discount: 30.0,
      rating: 1,
      SellerName: "meee",
      uid: "Me hunn",
      Sellerid: "20sw",
      NoOfRatings: 0,
    //  color: Colors.black,
      Category: "Sports"
    ),
  ),
];
