import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final args=ModalRoute.of(context).settings.arguments as Map;

    // print(args);

    return Container(
      height: screen.calc(98),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);//左上返回
            },
            child: Container(
              child: Image.asset('assets/icon-left-arrow-w.png', width: screen.calc(50), height: screen.calc(50),),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: screen.calc(20)),
              child: Column(
                children: [
                  Text('Somewhere only We know', style: TextStyle(color: Colors.white, fontSize: screen.calc(30), fontWeight: FontWeight.w700),),
                  Padding(
                    padding: EdgeInsets.only(top: screen.calc(4)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Keane', style: TextStyle(color: Color(0x99ffffff)),),
                      Image.asset('assets/icon-right-arrow-w.png', width: screen.calc(20), height: screen.calc(20),),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Image.asset('assets/icon-share-w.png', width: screen.calc(40), height: screen.calc(40),),
          ),
        ],
      ),
    );
  }

}