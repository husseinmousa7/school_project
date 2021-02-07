import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:school/utils/UniversalVariables.dart';
import 'package:shimmer/shimmer.dart';
class OnlineGame extends StatefulWidget {
  @override
  _OnlineGameState createState() => _OnlineGameState();
}

class _OnlineGameState extends State<OnlineGame> {


  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
      print("start game");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UniversalVariables.blackColor,
        alignment: Alignment.center,
        child: RoundedLoadingButton(
          color: UniversalVariables.blueColor,
          successColor: Colors.green,
          child: Text('أبحث عن منافس !', style: TextStyle(color: Colors.white),textDirection: TextDirection.rtl,),
          controller: _btnController,
          onPressed: _doSomething,
        )
      ),
    );
  }
}
