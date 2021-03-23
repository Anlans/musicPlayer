import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';

class PlayerInner extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final args=ModalRoute.of(context).settings.arguments as Map;
    final d=useState(0.0);//转的角度

    Timer(Duration(milliseconds: 16), (){
      d.value+=1;
    });

    // print(args);

    return Container(
      margin: EdgeInsets.only(top:screen.calc(182)),
      child: Stack(
        children: [
          //唱片
          Positioned(
            child: Transform.rotate(//使用其中的角度
              angle: d.value*pi/180,//弧度
              child: Container(
                width: screen.calc(618),
                height: screen.calc(618),
                child: Stack(//用于叠歌曲图片
                  children: [
                    //封面
                    Center(
                      child: Container(
                        color: Colors.black,//图片不够大则用剩下的black填充空白唱盘
                        child: Image.asset('assets/tmp_cover_7.jpg', width: screen.calc(390), height: screen.calc(390),),
                      ),
                    ),
                    //唱片
                    Positioned.fill(//宽高自适应
                      child: Image.asset('assets/player-disc.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          //唱针
          Positioned(
            child: Image.asset('assets/player-arm.png'),
          ),
        ],
      ),

    );
  }

}





