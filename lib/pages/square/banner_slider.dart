import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';

var items=[
  {'index':0, 'title':'111'},
  {'index':1, 'title':'222'},
  {'index':2, 'title':'333'},
  {'index':3, 'title':'444'},
  {'index':4, 'title':'555'},
  {'index':5, 'title':'666'},
  {'index':6, 'title':'777'},
];

class BannerSlider extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final _value=useState(0);

    final
      prev=(_value.value-1+items.length)%items.length,
      cur=_value.value,
      next=(_value.value+1)%items.length;
    // print('prev: $prev, cur: $cur, next: $next');

    final W=screen.calc(344),H=screen.calc(438),offsetH=screen.calc(200),offsetV=screen.calc(40);

    Rect//方块位置
      prevRect=Rect.fromLTWH((screen.width-W*0.8)/2-offsetH, offsetV, W*0.8, H*0.8),
      curRect=Rect.fromLTWH((screen.width-W)/2, 0, W, H),
      nextRect=Rect.fromLTWH((screen.width-W*0.8)/2+offsetH, offsetV, W*0.8, H*0.8),//next此处为+offset
      otherRect=Rect.fromLTWH((screen.width-W)/2, 0, W, H);

    double
      prevOpacity=0.5,
      curOpacity=1.0,
      nextOpacity=0.5,
      otherOpacity=0.0;

    items.sort((item1, item2){
      // print('-----------------------');
      double opacity1, opacity2;
      // print('item1: $item1');
      if(item1['index']==prev)
        opacity1=prevOpacity;
      else if(item1['index']==cur)
        opacity1=curOpacity;
      else if(item1['index']==next)
        opacity1=nextOpacity;
      else opacity1=otherOpacity;

      // print('opacity1: $opacity1');

      // print('item2: $item2');
      if(item2['index']==prev)
        opacity2=prevOpacity;
      else if(item2['index']==cur)
        opacity2=curOpacity;
      else if(item2['index']==next)
        opacity2=nextOpacity;
      else opacity2=otherOpacity;


      // print('opacity2: $opacity2');

      if(opacity1<opacity2) return -1;
      else if(opacity1>opacity2) return 1;
      return 0;
    });

    // print(items);

    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.blue,
      // ),
      margin: EdgeInsets.only(top: screen.calc(38)),
      width: screen.width,
      height: H,
      child: Stack(//需要使用Position定位，用Stack方便
        children: items.map((item){

          Rect rect;
          double opacity;
          var index=item['index'];

          if(index==cur) {
            rect=curRect;
            opacity=curOpacity;
          }
          else if(index==prev) {
            rect=prevRect;
            opacity=prevOpacity;
          }
          else if(index==next) {
            rect=nextRect;
            opacity=nextOpacity;
          }
          else {
            rect=otherRect;
            opacity=otherOpacity;
          }


          return Positioned(
            left: rect.left,
            top: rect.top,

            child: Opacity(
              opacity: opacity,
              child: Container(
                width: rect.width,
                height: rect.height,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(item['title'], style: TextStyle(
                    fontSize: 40,
                  ),),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

}