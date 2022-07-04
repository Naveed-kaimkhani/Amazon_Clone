
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Models/OrderRequestModel.dart';
import 'package:ecommerce_app/Models/ReviewModel.dart';
import 'package:ecommerce_app/widget/SimpleProductWidget.dart';
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

    static   Future<String> uploadProductToDatabase({
    required Uint8List? image,
    required String productName,
    required String description,
    required double rawCost,
    required double discount,
    required String sellerName,
    required String sellerUid,
    required String Category,
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
        //    color: Colors.blue,
            Category: Category,
            );

        await FirebaseFirestore.instance
            .collection("products")
            .doc(uid)
            .set(product.getJson());
            print("Product uploaded to firestore");
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  static  Future<String> uploadImageToDatabase(
      {required Uint8List? image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadToask = storageRef.putData(image!);
    TaskSnapshot task = await uploadToask;
    print("image uploaded");
    return task.ref.getDownloadURL();

  }

 static Future<List<Widget>> getDataFromCategory({required String Category})async{
   List<Widget> Children=[];
   QuerySnapshot<Map<String,dynamic>> snap= await FirebaseFirestore.instance.collection("products").where("Category",isEqualTo: Category).get();

    for (var i = 0; i < snap.docs.length;i++) {
    DocumentSnapshot docsSnap=  snap.docs[i];

    Product model=Product.fromJson(docsSnap.data() as dynamic);
  Children.add(SimpleProductWidget(product: model));
    }
    return Children;
  }

  Future<void> UploadReview({required ReviewModel review,required String uid}) async{

      await firebaseFirestore.collection("products").doc(uid).collection("review").add(review.getjson());
  }
   
   
 static Future<void> AddToCart({required Product product}) async{

      await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").doc(product.uid).set(product.getJson());
  }
   
  static Future deleteProductFromCart({required String uid})async{
    await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").doc(uid).delete(); 
   }

  static Future BuyProductFromCart({required User_Details? user})async{
  QuerySnapshot<Map<String,dynamic>>  snapshot = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").get(); 
     for (var i = 0; i < snapshot.docs.length;i++) {
    DocumentSnapshot docsSnap=  snapshot.docs[i];

    Product model=Product.fromJson(docsSnap.data() as dynamic);
    addProductsToOrders(product: model,user: user);
    
   
   }
  }
static Future addProductsToOrders({required Product product,required User_Details? user})async{
    await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("orders").add(product.getJson()); 
  await deleteProductFromCart(uid: product.uid);
    await orderRequest(product: product , user: user!);  
   }

static Future orderRequest({required Product product,required User_Details user})async{
OrderRequestModel order=OrderRequestModel(name: product.ProductName, address:"somewhere on earth");
await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("OrderRequest").add(order.getJson(order));
}

}