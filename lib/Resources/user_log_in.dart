


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login{


  /////////////////////////////////////////////////////////////////////////////////   google sign in


  static Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

  }

  //////////////////////////////////////////////////////////////////////////////////  FaceBook Sign In


// static Future<UserCredential> signInWithFacebook(BuildContext context) async {
//    FacebookLogin facebookLogin = FacebookLogin();
//
//    final result = await facebookLogin.logIn(["public_profile", "email", "user_friends", "user_hometown", "user_likes"]);
//    final token = result.accessToken.token;
//    final graphResponse = await http.get(
//        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${token}'
//    );
//    final profile = json.decode(graphResponse.body);
//    print('hhhhhhhhhhhhhhhhhhhhhhh  $profile}');
//    if(result.status == FacebookLoginStatus.loggedIn){
//      final credential = FacebookAuthProvider.credential(token);
//      print("cccccccccccc ${credential.token}");
//      return FirebaseAuth.instance.signInWithCredential(credential).whenComplete((){
//        Login.userLoggedIn();
//      });
//    }
//
//  }

}