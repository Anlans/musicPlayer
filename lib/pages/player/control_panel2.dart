import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

class ControlPanel2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final args=ModalRoute.of(context).settings.arguments as Map;

    // print(args);

    return Container(
      margin: EdgeInsets.only(bottom: screen.calc(32), top: screen.calc(14)),
      height: screen.calc(120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//平均排列
        children: [
          Center(
            child: Image.asset('assets/icon-playloop-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: Image.asset('assets/icon-backward-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Container(
            height: screen.calc(120),
            width: screen.calc(120),
            decoration: BoxDecoration(
              border: Border.all(width: screen.calc(2), color: Colors.white),
              borderRadius: BorderRadius.circular(screen.calc(60)),
            ),
            child: Center(
              child: Image.asset('assets/icon-pause-w.png', width: screen.calc(55), height: screen.calc(55),),
            ),
          ),

          Center(
            child: Image.asset('assets/icon-forward-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: Image.asset('assets/icon-playlist-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
        ],
      ),
    );
  }

}