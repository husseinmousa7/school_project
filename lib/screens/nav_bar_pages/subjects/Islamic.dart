import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school/utils/UniversalVariables.dart';
import 'package:school/widgets/appbar.dart';

class Islamic extends StatefulWidget {
  @override
  _IslamicState createState() => _IslamicState();
}

class _IslamicState extends State<Islamic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("5",style: TextStyle(color: Colors.yellowAccent,)),
            IconButton(icon: Icon(Icons.add,color: Colors.yellowAccent,), onPressed: (){
            }),
          ],
        ),
        centerTitle: true,
        leading:Container(
          // margin: EdgeInsets.only(left: 5),
          child: Row(children: [
            IconButton(icon: Icon(Icons.favorite,color: Colors.red,),onPressed: (){},),
            Text("5",style: TextStyle(color: Colors.red,)),
          ],),
        ),
        actions: [
          Row(
            children: [
              Text("الرياضيات"),
              IconButton(icon: Icon(Icons.flag),onPressed: (){},),
            ],
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color:Colors.deepPurple,
       child: ListView.builder(
           itemCount: 10,
           itemBuilder: (context, index) {
             return Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 FlatButton(onPressed:(){
                 }, child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [

                     Icon(Icons.query_builder),
                     Text("الفصل الاول"),

                   ],
                 )
                 ),

//                 VerticalDivider(width: 22,color: Colors.black,thickness: 22,endIndent: 20,),
                 FlatButton(child: Text("فراغات"),onPressed: (){

                 },),
//                 VerticalDivider(width: 22,color: Colors.black,thickness: 22,endIndent: 20,),
                 FlatButton(child: Text("تعاليل"),onPressed: (){

                 },),
//                 VerticalDivider(width: 22,color: Colors.black,thickness: 22,endIndent: 20,),
                 FlatButton(child: Text("تعاريف"),onPressed: (){

                 },),
                  Divider(thickness: 2,color: Colors.grey,),

               ],

             );
           },),
      ),
    );
  }
}
