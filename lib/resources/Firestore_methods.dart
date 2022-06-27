import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../Models/Product.dart';
import '../Models/User_Details.dart';
import '../constant/Utils.dart';

class Firestore_method{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
static Future  uploadDataToFirestore({required name,required phone}) async{

     await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set(
       {"name":name,
        "phone":phone
      } 
      );
  }

 Future<User_Details?> getNameAndAddress()async {
    DocumentSnapshot snapshot= await firebaseFirestore.collection("Users").doc(firebaseAuth.currentUser!.uid).get();
    User_Details user_details=User_Details.getModelFromJson(snapshot.data() as dynamic);
  }

    Future<String> uploadProductToDatabase({
    required Uint8List? image,
    required String productName,
    required String description,
    required double rawCost,
    required double discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    productName.trim();
    //rawCost.trim();
    String output = "Something went wrong";

    if (image != null && productName != "" && rawCost != "") {
      try {
        String uid = Utils().getUid();
        String url = await uploadImageToDatabase(image: image, uid: uid);
        double cost = rawCost;
        cost = cost - (cost * (discount / 100));
        Product product = Product(
            url: url,
            ProductName: productName,
            description: description,
            price: rawCost,
            discount: discount,
            uid: uid,
            SellerName: sellerName,
            Sellerid: sellerUid,
            rating: 5,
            NoOfRatings: 0,
            color: Colors.blue,
            
            );

        await firebaseFirestore
            .collection("products")
            .doc(uid)
            .set(product.getJson());
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

    Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadToask = storageRef.putData(image);
    TaskSnapshot task = await uploadToask;
    return task.ref.getDownloadURL();
  }

   
}