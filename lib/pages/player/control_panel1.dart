import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

class ControlPanel1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final args=ModalRoute.of(context).settings.arguments as Map;

    // print(args);

    return Container(
      height: screen.calc(55),
      margin: EdgeInsets.only(bottom: screen.calc(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//平均排列
        children: [
          Center(
            child: Image.asset('assets/icon-heart-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: Image.asset('assets/icon-download-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: Image.asset('assets/icon-bell-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: Image.asset('assets/icon-message-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: Image.asset('assets/icon-3dot-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
        ],
      ),
    );
  }

}