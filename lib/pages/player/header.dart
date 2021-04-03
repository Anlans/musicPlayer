import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/home/home.dart';

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
                  Text(recommendList1[cnt]['title'], style: TextStyle(color: Colors.white, fontSize: screen.calc(30), fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis, maxLines: 1,),
                  Padding(
                    padding: EdgeInsets.only(top: screen.calc(4)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(recommendList1[cnt]['artist'], style: TextStyle(color: Color(0x99ffffff), fontSize: screen.calc(20)), overflow: TextOverflow.ellipsis, maxLines: 1,),
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