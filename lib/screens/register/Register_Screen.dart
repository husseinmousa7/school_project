import 'package:flutter/material.dart';
import 'package:school/Resources/firebase_methods.dart';
import 'package:school/utils/UniversalVariables.dart';
import 'package:school/Resources/user_log_in.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool loginPressed = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.senderColor,
      body: Stack(
        children: [

          Image.asset(
            'images/bg.gif',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.PNG',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    color: Color(0xffEE5A24),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          period: Duration(seconds: 2),
                          direction: ShimmerDirection.rtl,
                          baseColor: Colors.black,
                          highlightColor: Colors.white10,
                          child: FlatButton(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "سجل الدخول مع كوكل",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.2),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                loginPressed = true;
                              });
                              Login.signInWithGoogle(context).whenComplete((){
                                FirebaseMethods.authenticateUser(FirebaseAuth.instance.currentUser).then((isNewUser){
                                  if(isNewUser == true){
                                    print("new user");
                                    FirebaseMethods.addDataToDb(FirebaseAuth.instance.currentUser).whenComplete((){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),));
                                    });
                                    setState(() {
                                      loginPressed = false;
                                    });
                                  }else{
                                    print("old user");
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),));
                                    setState(() {
                                      loginPressed = false;
                                    });
                                  }
                                });
                              }).catchError((e){
                                print(e);
                                setState(() {
                                  loginPressed = false;
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    color: UniversalVariables.blueColor,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          period: Duration(seconds: 2),
                          direction: ShimmerDirection.rtl,
                          baseColor: Colors.black,
                          highlightColor: Colors.white10,
                          child: FlatButton(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "سجل الدخول مع فيسبوك",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.2),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              print('Sign in');
                            },
                          ),                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: loginPressed == true ? CircularProgressIndicator(strokeWidth: 5,) : Container(),
          ),


          Container(
            margin: EdgeInsets.only(top: 70,left: 20),
            alignment: Alignment.topCenter
              ,child: Text("تطبيق طُموح",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold,wordSpacing: 15,),)
          ),

        ],
      ),
    );
  }
}
