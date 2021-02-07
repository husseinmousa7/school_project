import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school/models/user.dart';
import 'package:school/utils/utilities.dart';

class FirebaseMethods{


  static Future<User>getCurrentUser()async{
    User currentUser =await FirebaseAuth.instance.currentUser;
    return  currentUser;
  }



  static Future<bool> authenticateUser(User user)async{
    QuerySnapshot result = await  FirebaseFirestore.instance.collection('users')
        .where('email',isEqualTo: user.email)
        .get();

    List docs =result.docs;

    return docs.length  == 0 ? true : false;
  }




  static Future<void> addDataToDb(User currentUser)async{
    UserModel userModel = new UserModel();

    String username = Utils.getUsername(currentUser.email);

    userModel =UserModel(
      uid : currentUser.uid  ,
      email : currentUser.email ,
      name : currentUser.displayName,
      profilephoto : currentUser.photoURL,
      username: username,
      state:null,
      status:null ,
    );
    FirebaseFirestore.instance.collection('users').doc(currentUser.uid).set(
      UserModel().toMap(userModel),
    );
  }


  static Future<Map> getFeedData(){



  }


}