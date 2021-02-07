import 'package:firebase_auth/firebase_auth.dart';

class UserModel{

  String uid;
  String question;
  String answer;


  UserModel({this.uid,this.question,this.answer});


  Map toMap(UserModel userModel){
    var feedData = Map<String,dynamic>();
    feedData['uid']= userModel.uid;
    feedData['question'] =userModel.question;
    feedData ['answer'] =userModel.answer;
    return feedData;
  }

  UserModel.fromMap(Map mapData){
    this.uid = mapData['uid'];
    this.question=mapData['question'];
    this.answer=mapData['answer'];
  }


}