import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Models/User_Details.dart';

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
}