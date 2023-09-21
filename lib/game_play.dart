import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maths_puzzle/ans_file.dart';
import 'package:maths_puzzle/main.dart';
import 'package:maths_puzzle/win_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GamePlay extends StatefulWidget 
{
  int cur_level;
  GamePlay(this.cur_level);

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  String str="";
  int cur_level=0;

  SharedPreferences?  pref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    pref=await SharedPreferences.getInstance();
    setState(() {
        cur_level=widget.cur_level;
     //      cur_level=pref!.getInt("level") ?? 0;
    });
    print("CUrLevel=$cur_level");
    for(int i=0;i<cur_level;i++)
      {
         String a;
          a= pref!.getString("puzzle_status${i}")?? "";
          print("Level$i :$a");
      }
  }
  @override
  Widget build(BuildContext context) {
    double top_padding=MediaQuery.of(context).padding.top;
    double bot_padding=MediaQuery.of(context).padding.bottom;
    double tot_hight=MediaQuery.of(context).size.height;
    double screen_size=tot_hight-top_padding-bot_padding;
    return WillPopScope(child: Scaffold(body: Container(margin: EdgeInsets.only(top: top_padding),height: screen_size,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/gameplaybackground.jpg"))),
      child:
      Column(children: [
        Expanded(flex:6,child:
        Container(child:
        Column(children: [
          Expanded(child:    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
            ,children: [
            InkWell(onTap: () {
              skip_fun(context);
            },child: Container(margin: EdgeInsets.fromLTRB(10, 10, 0, 10),width: 40,height: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/skip.png"))),),),
            Container(alignment: Alignment.center,child: Text("Puzzle ${cur_level+1}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),width: 130,height: 40,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/level_board.png"))),),
            InkWell(onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return First();
              },));
            },child: Container(margin: EdgeInsets.fromLTRB(0, 10, 10, 10),width: 40,height: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/hint.png"))),),)
          ],),),
          Expanded(flex: 3,child:
          Container(margin: EdgeInsets.all(10),decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/p${cur_level+1}.png")))),),
          Expanded(child: Container()),
        ]),)),
        Expanded(child: Container(alignment: Alignment.centerLeft,width: double.infinity, color: Colors.black,child:
        Column(children: [
          Expanded(child: Container(child:  Row(children: [
            Container(alignment: Alignment.centerLeft,child: Text("$str",style: TextStyle(color: Colors.black),),margin: EdgeInsets.all(5),width: 160,height: 30,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(7),border: Border.all(width: 2,color: Colors.white)),),
            InkWell(onTap: () {
              setState(() {
                str=str.substring(0,str.length-1);
              });
            },child:  Container(margin: EdgeInsets.all(5),width: 40,height: 30,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/delete.png")),),),
            ),
            InkWell(onTap: () => sub_fun(context),child: Container(alignment: Alignment.center,width: 80,height: 30,child: Text("SUBMIT",style: TextStyle(color: Colors.white),),),),
          ],),)),
          Expanded(child:  Row(children: [
            Expanded(child: InkWell(onTap: () => myfun(1),child: Container(alignment: Alignment.center,child: Text("1",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(2),child: Container(alignment: Alignment.center,child: Text("2",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(3),child: Container(alignment: Alignment.center,child: Text("3",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(4),child: Container(alignment: Alignment.center,child: Text("4",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(5),child: Container(alignment: Alignment.center,child: Text("5",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(6),child: Container(alignment: Alignment.center,child: Text("6",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(7),child: Container(alignment: Alignment.center,child: Text("7",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(8),child: Container(alignment: Alignment.center,child: Text("8",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(9),child: Container(alignment: Alignment.center,child: Text("9",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
            Expanded(child: InkWell(onTap: () => myfun(0),child: Container(alignment: Alignment.center,child: Text("0",style: TextStyle(color: Colors.white),),margin: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.white)),),)),
          ],))
        ],),))
      ],),),), onWillPop: ()async {
        showDialog(context: context, builder: (context) {
          return AlertDialog(title: Text("do you want to exit .."),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("No")),
            TextButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return First();
              },));
            }, child: Text("Yes"))
          ],);
        },);
      return true;
      },);
  }
  myfun(int a)
  {
        setState(() {
          str=str+a.toString();
        });
  }
   sub_fun(BuildContext context) async
   {
        if(ans.ans_list[cur_level]==(int.parse(str))){
          await  pref!.setString("puzzle_status$cur_level", "win");

          cur_level++;
          int mylevel=pref!.getInt("level")?? 0;
          if(mylevel<cur_level) {
            await pref!.setInt("level", cur_level);
          }

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return WinPage(cur_level-1);
          },));
        }else
          {
            setState(() {
              str="";
            });
            Fluttertoast.showToast(
                msg: "Wrong Ans",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );

          }
   }
  skip_fun(BuildContext context) async
  {
    int min=0;
    DateTime skip = DateTime.now();
    DateTime pre_time;
    String str=pref!.getString("skip_time") ?? "";
    print("Str : ${str}");
      await  pref!.setString("puzzle_status$cur_level", "skip");
        if(!str.isEmpty)
          {
              pre_time=DateTime.parse(pref!.getString("skip_time")?? "");
              min=skip.difference(pre_time).inMinutes;
              print("MIN :$min");

             if(min<2)
               {
                     Fluttertoast.showToast(
                     msg: "you can skip after 2 min",
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.CENTER,
                     timeInSecForIosWeb: 1,
                     backgroundColor: Colors.red,
                     textColor: Colors.white,
                     fontSize: 16.0);
               }else
               {
                 String skip_time = skip.toString();
                 await pref!.setString("skip_time", skip_time);
                 cur_level++;
                 await pref!.setInt("level", cur_level);
                   Navigator.pushReplacement(
                       context, MaterialPageRoute(builder: (context) {
                     return GamePlay(cur_level);
                   },));
               }


          }else {
          String skip_time = skip.toString();
          await pref!.setString("skip_time", skip_time);
          cur_level++;
          await pref!.setInt("level", cur_level);
          Fluttertoast.showToast(
              msg: "Skip Level",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) {
            return GamePlay(cur_level);
          },));
        }
  }
}


