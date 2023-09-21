import 'package:flutter/material.dart';
import 'game_play.dart';
import 'main.dart';

class WinPage extends StatefulWidget {
 int cur_level;
 WinPage(this.cur_level);

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Puzzle ${widget.cur_level}Complete"),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GamePlay(widget.cur_level+1);
              },));
            }, child: Text("Continue")),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return First();
              },));
            }, child: Text("MainMenu")),
          ],
        ),
      ),
    );
  }
}
