import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maths_puzzle/game_play.dart';
import 'package:maths_puzzle/puzzle.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

//   DateTime now = DateTime.now();
//  // print("Date : ${now.hour}: ${now.minute} : ${now}");
// String skip_time="2022-08-01 09:55:06.338281";
//
// print("Skip_time : ${skip_time}");
// print("NOw :${now}");
// DateTime dt1=DateTime.parse(skip_time);
// print("Duration : ${now.difference(dt1).inMinutes}");
// //print("Difference : ${now.difference(skip_time.)}");

  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: First(),));
}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  int cur_level=0;
  bool temp=false;
  bool temp1=false;
  bool temp2=false;
  SharedPreferences ?pref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_session();
  }
  get_session() async
  {
    pref=await SharedPreferences.getInstance();
    setState(() {
      cur_level=pref!.getInt("level") ?? 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    double tot_height=MediaQuery.of(context).size.height;
    double tot_width=MediaQuery.of(context).size.width;
    double status_bar_size=MediaQuery.of(context).padding.top;
    double bottom_bar_size=MediaQuery.of(context).padding.bottom;
    double screen_size=tot_height-status_bar_size-bottom_bar_size;
    return WillPopScope(child: Scaffold(body: Container(width: double.infinity,margin: EdgeInsets.only(top: status_bar_size),height: screen_size,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/background.jpg"))),
      child: Column(children: [
        Expanded(child: Container(alignment: Alignment.center,margin: EdgeInsets.only(top: 20),child: Text("Math Puzzles",style: TextStyle(fontSize: 30,color: Colors.blueAccent,fontWeight: FontWeight.bold),),)),
        Expanded(flex: 4,child: Container(width: double.infinity,margin: EdgeInsets.all(10),decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/blackboard_main_menu.png"))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            GestureDetector(child:  Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: (temp==true)? Border.all(color: Colors.white,width: 3) : null),child: Text("CONTINUE",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "myfont"),),),
              onTapDown: (details) {
                print("ontap down");
                setState(() {
                  temp=true;

                });
              },
              onTapUp: (details) {
                print("onTapup");
                setState(() {
                  temp=false;
                  myfun();
                });
              },

            ),
            SizedBox(height: 10,),
            GestureDetector(child:  Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border:  Border.all(color: (temp1==true)?Colors.white : Colors.black,width: 3) ),child: Text("PUZZLE",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "myfont"),),),
              onTapDown: (details) {
                print("ontap down");
                setState(() {
                  temp1=true;
                });
              },
              onTapUp: (details) {
                print("onTapup");
                setState(() {
                  temp1=false;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return Puzzle();
                  },));
                });
              },

            ),
            SizedBox(height: 10,),
            GestureDetector(child:  Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border:  Border.all(color:(temp2==true)? Colors.white : Colors.transparent,width: 3) ),child: Text("BUY PRO",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "myfont"),),),
              onTapDown: (details) {
                print("ontap down");
                setState(() {
                  temp2=true;
                });
              },
              onTapUp: (details) {
                print("onTapup");
                setState(() {
                  temp2=false;
                });
              },

            ),

          ],),)),
        Expanded(child: Container(color: Colors.blueAccent,))
      ],),
    ),), onWillPop: ()async {
      showDialog(context: context, builder: (context) {
        return AlertDialog(title: Text("do you want to exit .."),
          actions: [
            TextButton(onPressed: () {
              exit(0);
            }, child: Text("No")),
            TextButton(onPressed: () {
            Navigator.pop(context);
            exit(0);
            }, child: Text("Yes"))
          ],);
      },);

      return true;
    },);
  }
  
  myfun()
  {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return GamePlay(cur_level);
        },));
  }
  
}
