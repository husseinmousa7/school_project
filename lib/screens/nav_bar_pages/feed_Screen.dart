import 'package:flutter/material.dart';
import 'package:school/screens/nav_bar_pages/subjects/Islamic.dart';
import 'package:school/utils/UniversalVariables.dart';
import 'package:school/utils/sizing.dart';
import 'package:school/widgets/appbar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();

}

class _FeedScreenState extends State<FeedScreen> {
  List<String> subjects = [
    'التربية الإسلامية',
    'اللغة العربية',
    'اللغة الإنكليزية',
    'الرياضيات',
    'الفيزياء',
    'الكيمياء',
    'الأحياء',
  ];

  List<String> subjectsImages = [
    'https://i0.wp.com/data.whicdn.com/images/267927674/original.gif',
    'https://i0.wp.com/gifimage.net/wp-content/uploads/2017/09/anime-background-scenery-gif-9.gif',
    'https://i0.wp.com/33.media.tumblr.com/2187e0bf763bd9d54a7446009a06400b/tumblr_mtdy5qpHia1sb87h1o1_500.gif',
    'https://i0.wp.com/data.whicdn.com/images/221988456/original.gif',
    'https://i0.wp.com/31.media.tumblr.com/ad9240043795b6f966a3c7ab5bcee9aa/tumblr_inline_nfpj8uucP11s6lw3t.gif',
    'https://i0.wp.com/pa1.narvii.com/5838/31e0ba06a0d9e321625c2849d101b94dce0f90aa_hq.gif',
    'https://i0.wp.com/media.giphy.com/media/VDo1OeV57IPPG/giphy.gif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("5",
                style: TextStyle(
                  color: Colors.yellowAccent,
                )),
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.yellowAccent,
                ),
                onPressed: () {}),
          ],
        ),
        centerTitle: true,
        leading: Container(
          // margin: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              Text("5",
                  style: TextStyle(
                    color: Colors.red,
                  )),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Text("الرياضيات"),
              IconButton(
                icon: Icon(Icons.flag),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: UniversalVariables.blackColor,
          child: Column(
            children: [
              StreamBuilder(
                stream:  FirebaseFirestore.instance.collection("feed_questions").doc('atkpthqN6a77UfUh79ck').snapshots(),
                  builder: (context, snapshot) {
                  if(snapshot.hasData){
                    print(snapshot);
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.5,
// height: MediaQuery.of(context).size.height *0.4,
                          child: Column(
                            children: [
                              Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Image.asset('images/logo.PNG',fit: BoxFit.cover,
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                  title: Container(
                                    child: Text("المرشد",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                                    margin: EdgeInsets.only(top: 15),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Text(
                                        "اجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالر",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                  color: UniversalVariables.blueColor,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.4,
                                                  alignment: Alignment.center,
                                                  child: Shimmer.fromColors(
                                                      period: Duration(seconds: 3),
                                                      direction: ShimmerDirection.rtl,
                                                      baseColor: Colors.black,
                                                      highlightColor: Colors.white10,
                                                      child: Text(
                                                        "اجب عن السؤال",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black),
                                                      ))),
                                              onTap: () {
                                                print("Comment page");
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }else{
                    return Container();
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//
//void navigatorFunction(context, int index) {
//  if (index == 0) {
//    Navigator.of(context).push(MaterialPageRoute(
//      builder: (context) => Islamic(),
//    ));
//  }
//  if(index == 1){
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Arabic() ,))
//  }
//  if(index == 2){
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>English(), ,))
//  }
//  if(index == 3){
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Math(),))
//  }
//  if(index == 4){
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Physics(),))
//  }
//  if(index == 5){
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chemistry(),))
//  }
//  if(index == 6){
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Biology(),))
//  }
//}

//body: SingleChildScrollView(
//child: Container(
//color: UniversalVariables.blackColor,
//child: Column(
//children: [
//ListView.builder(
//physics: ClampingScrollPhysics(),
//shrinkWrap: true,
//itemCount: 10,
//itemBuilder: (context, index) {
//return Container(
//width: MediaQuery.of(context).size.width * 0.5,
//// height: MediaQuery.of(context).size.height *0.4,
//child: Column(
//children: [
//Card(
//child: ListTile(
//leading: CircleAvatar(),
//title: Text("المعلم"),
//subtitle:Column(
//children: [
//Text("اجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالاجب عن السؤالر",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,color: Colors.black,),),
//Divider(),
//Container(
//child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: [
//GestureDetector(
//child: Container(
//color: UniversalVariables.blueColor,
//width: MediaQuery.of(context).size.width *0.4,
//alignment: Alignment.center,
//child: Shimmer.fromColors(
//period: Duration(seconds: 3),
//direction: ShimmerDirection.rtl,
//baseColor: Colors.black,
//highlightColor: Colors.white10,
//child: Text("اجب عن السؤال",style: TextStyle(fontSize:15,color: Colors.black),
//)
//)
//),
//onTap: (){
//print("Comment page");
//},
//),
//],
//),
//),
//],
//),
//),
//),
//
//],
//),
//);
//},
//),
//],
//),
//),
//),
