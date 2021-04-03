import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/home/home.dart';

class PlayerInner extends HookWidget{
  final bool playing;//判断唱针是否要动

  PlayerInner({Key key, this.playing=false}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final args=ModalRoute.of(context).settings.arguments as Map;
    final d=useState(0.0);//转的角度

    Timer(Duration(milliseconds: 16), (){
      if(playing) {
        d.value += 1;
      }
    });

    // print(args);

    return Container(
      height: screen.calc(800),
      child: Stack(
        children: [
          //唱片
          Positioned(
            left: screen.calc(41),
            top: screen.calc(182),
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
                        child: Image.network(recommendList1[cnt]['img'], width: screen.calc(400), height: screen.calc(400),),
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
            left: screen.calc(331),
            top: screen.calc(24),
            child: Transform.rotate(
              origin: Offset(screen.calc(-137), screen.calc(-80)),
              angle: playing?30*pi/180:0, //30自己微调
              child: Image.asset('assets/player-arm.png',width: screen.calc(314), height: screen.calc(198),),
            ),
          ),
        ],
      ),

    );
  }

}





