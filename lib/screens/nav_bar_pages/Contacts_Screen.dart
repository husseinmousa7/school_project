import 'package:flutter/material.dart';
import 'package:school/widgets/custom_tile.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomTile(
          leading: CircleAvatar(),
          title: Text("Hussein",style: TextStyle(color: Colors.white),),
          subtitle: Text("Text",style: TextStyle(color: Colors.white),),
          mini: false,
        );
      },
    );
  }
}
