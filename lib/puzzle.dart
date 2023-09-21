import 'package:flutter/material.dart';
import 'package:maths_puzzle/ans_file.dart';
import 'package:maths_puzzle/game_play.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Puzzle extends StatefulWidget {
  const Puzzle({Key? key}) : super(key: key);

  @override
  State<Puzzle> createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  SharedPreferences?  pref;
  int level=0;
  List<String> level_status=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level_status=List.filled(ans.ans_list.length, "no");
    get_pre();
  }
  get_pre() async
  {
    print("Hello");
    pref=await SharedPreferences.getInstance();
      setState(() {
        level=pref!.getInt("level") ?? 0;
        for(int i=0;i<level_status.length;i++){
          level_status[i]=pref!.getString("puzzle_status$i") ?? "no";
        }
        print("levelStatis :$level_status");
      });
      print("Level :$level");
  }

  @override
  Widget build(BuildContext context) {
    double tothight=MediaQuery.of(context).size.height;
    double top_pading=MediaQuery.of(context).padding.top;
    double bot_pading=MediaQuery.of(context).padding.bottom;
    double screen_size=tothight-top_pading-bot_pading;
    return Scaffold(body: Container(padding: EdgeInsets.symmetric(horizontal: 10),height: screen_size,margin: EdgeInsets.only(top: top_pading),decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/background.jpg"))),child:
      GridView.builder(itemCount: ans.ans_list.length ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4, mainAxisSpacing: 10,crossAxisSpacing: 10 ),
        itemBuilder: (context, index) {
        return InkWell(onTap: () => (index<level) ? myfun(context,index) : null,child: Container(alignment: Alignment.center,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: (index<level) ? Border.all(color: Colors.black26,width: 2) : null,
            image: (level_status[index]=="win") ? DecorationImage(image: AssetImage("image/tick.png"))  :(level_status[index]=="no") ? DecorationImage(image: AssetImage("image/lock.png")) : null),
          child: (index<level) ? Text("${index+1}",style: TextStyle(fontSize: 50,fontFamily: "myfont"),) : null,
        ),);
      },),),);
  }
  myfun(BuildContext context, int index)
  {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GamePlay(index);
          },));
  }
}
