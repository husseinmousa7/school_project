
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:school/utils/UniversalVariables.dart';

import 'nav_bar_pages/Contacts_Screen.dart';
import 'nav_bar_pages/OnlineGame_Screen.dart';
import 'nav_bar_pages/User_profile.dart';
import 'nav_bar_pages/feed_Screen.dart';
class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  PageController pageController;
  int _page=3;


  void onPageChanged(int page){
    setState(() {
      print(page);
      if(page == 0){
        _page = 3;
      }
      if(page == 1){
        _page = 2;
      }
      if(page == 2){
        _page = 1;
      }
      if(page == 3){
        _page = 0;
      }
    });
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {

    double _labelFontSize= 10;
    return Container(          // PickupLayout
      child: Scaffold(//scaffold
        backgroundColor:UniversalVariables.blackColor,

        body: PageView(
          reverse: true,
          children: [
            FeedScreen(),//Center(child: Text("الرئيسة",style: TextStyle(color: Colors.white),),),
            OnlineGame(),//Center(child: Text("العب ضد شخض",style: TextStyle(color: Colors.white),),),
            ContactsScreen(),//Center(child: Text("الرسائل",style: TextStyle(color: Colors.white),),),
            MyHomePage(),//Center(child: Text("الحساب",style: TextStyle(color: Colors.white),),),
          ],
          controller: pageController,
          onPageChanged:onPageChanged ,
        ),


        bottomNavigationBar:Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CupertinoTabBar(
              activeColor: Colors.blue,
              backgroundColor: UniversalVariables.blackColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box,
                  ),
                  label:"الحساب",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message,
//                    color: (_page==2) ? UniversalVariables.lightBlueColor : UniversalVariables.greyColor ,
                  ),
                  label:"الرسائل",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.videogame_asset,
//                    color: (_page==1) ? UniversalVariables.lightBlueColor : UniversalVariables.greyColor ,
                  ),
                  label:"العب ضد شخص",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard,
//                    color: (_page==0) ? UniversalVariables.lightBlueColor : UniversalVariables.greyColor ,
                  ),
                  label:"الرئيسية",
                ),
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            ),
          ),
        ) ,
      ),
    );
  }
}
