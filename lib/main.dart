import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Resources/firebase_methods.dart';
import 'screens/Home.dart';
import 'screens/register/Register_Screen.dart';
main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        home: Register(),
      )
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: FutureBuilder(
        future: FirebaseMethods.getCurrentUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            //user is logged in
            return Home();
          }else{
            //user is not logged in
            return Register();
          }
        },
      ),
    );
  }
}


