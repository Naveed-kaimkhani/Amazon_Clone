import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore_method{

static Future  uploadDataToFirestore({required name,required phone}) async{

     await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set(
       {"name":name,
        "phone":phone
      } 
      );
  }
}