import 'package:firebase_auth/firebase_auth.dart';

class UserModel{

  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilephoto;

  UserModel({this.uid,this.name,this.email,this.username,this.status,this.state,this.profilephoto});


  Map toMap(UserModel userModel){
    var data = Map<String,dynamic>();
    data['uid']= userModel.uid;
    data['name'] =userModel.name;
    data ['email'] =userModel.email;
    data ['username']= userModel.username;
    data ['status'] =userModel.status;
    data ['state'] =userModel.state;
    data ['profilephoto']= userModel.profilephoto;
    return data;
  }

  UserModel.fromMap(Map mapData){
    this.uid = mapData['uid'];
    this.name=mapData['name'];
    this.email=mapData['email'];
    this.username=mapData['username'];
    this.status=mapData['status'];
    this.state=mapData['state'];
    this.profilephoto=mapData['profilephoto'];

  }


}