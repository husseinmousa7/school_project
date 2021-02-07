import 'package:flutter/material.dart';
import 'package:school/utils/UniversalVariables.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  CustomAppBar({
    @required this.title,
    @required this.actions,
    @required this.leading,
    @required this.centerTitle,
  });


  final Size preferredSize = const Size.fromHeight(kTextTabBarHeight+10);

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding:EdgeInsets.symmetric(vertical: 30) ,
      decoration: BoxDecoration(
        color: UniversalVariables.blackColor,
        border: Border(
          bottom: BorderSide(
            color: UniversalVariables.separatorColor,
            width: 1.4,
            style: BorderStyle.solid
          )
        )
      ),
      child: AppBar(
        backgroundColor: UniversalVariables.lightBlueColor,
        actions: actions,
        elevation: 0.0,
        leading:leading ,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }


}








