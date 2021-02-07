import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class Utils{

  static String getUsername(String email){
    return 'Student:${email.split('@')[0]}';
  }


//  static String getInitials(String name){
//   List<String> nameSplit = name.split(" ");
//   String firstNameInitial = nameSplit[0][0];  //[0] return first name [0] return first litter of first name
//   String lastNameInitial = nameSplit[1][0];
//  return firstNameInitial + lastNameInitial ;
//  }


//  static Future<File>pickImage({@required ImageSource source})async{
//    PickedFile _selectedImage = await ImagePicker().getImage(source: source);
//    File selectedImage = File(_selectedImage.path);
//    //return selectedImage;
//    return compressImage(selectedImage);
//  }
//
//  static Future<File>compressImage(File imageToCompress)async{
//
//    final tempDir = await getTemporaryDirectory();
//
//    final path = tempDir.path;
//
//    int random = Random().nextInt(1000);
//
//    Im.Image image = Im.decodeImage(imageToCompress.readAsBytesSync());
//    Im.copyResize(image,width: 500,height: 500);
//    return new File('$path/img_$random.jpg')
//        ..writeAsBytesSync(Im.encodeJpg(image,quality: 85));
//
//  }

}