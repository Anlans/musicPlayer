import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';

var items=[
  {'index':0, 'title':'请保持眉梢欢悦，因为有人等你对视', 'img': 'assets/tmp_square_cover_1.png'},
  {'index':1, 'title':'222', 'img': 'assets/tmp_square_cover_2.png'},
  {'index':2, 'title':'333', 'img': 'assets/tmp_square_cover_3.png'},
  {'index':3, 'title':'444', 'img': 'assets/tmp_square_cover_1.png'},
  {'index':4, 'title':'555', 'img': 'assets/tmp_square_cover_2.png'},
  {'index':5, 'title':'666', 'img': 'assets/tmp_square_cover_3.png'},
  {'index':6, 'title':'777', 'img': 'assets/tmp_square_cover_2.png'},
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

    final//存储opacity数据，scale数据用于滑动slider时的大小改变的数据
      secondaryData={'scale': .8, 'opacity': .5},//prevData == nextData
      curData={'scale': 1.0, 'opacity': 1.0},
      otherData={'scale': .8, 'opacity': 0.0};


    items.sort((item1, item2){
      // print('-----------------------');
      double opacity1, opacity2;
      // print('item1: $item1');
      if(item1['index']==prev || item1['index']==next)
        opacity1=secondaryData['opacity'];
      else if(item1['index']==cur)
        opacity1=curData['opacity'];
      else opacity1=otherData['opacity'];

      // print('opacity1: $opacity1');
      // print('item2: $item2');

      if(item2['index']==prev || item2['index']==next)
        opacity2=secondaryData['opacity'];
      else if(item2['index']==cur)
        opacity2=curData['opacity'];
      else opacity2=otherData['opacity'];

      // print('opacity2: $opacity2');

      if(opacity1<opacity2) return -1;
      else if(opacity1>opacity2) return 1;
      return 0;
    });

    // print(items);
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails detail){
        // print(detail.velocity.pixelsPerSecond.dx);//拖动速度快慢,左拖负
        var dx=detail.velocity.pixelsPerSecond.dx;
        if(dx.abs()>=50){//误触不理会
          if(dx<0){//左拖
            _value.value=(_value.value+1)%items.length;//下一个
          }else{    //右拖
            _value.value=(_value.value-1+items.length)%items.length;//上一个
          }
        }
      },//横向拖曳

      child: Container(
        // decoration: BoxDecoration(
        //   color: Colors.blue,
        // ),
        margin: EdgeInsets.only(top: screen.calc(38)),
        height: H,
        child: Stack(//需要使用Position定位，用Stack方便
          children: items.map((item){

            var data;
            var index=item['index'];

            if(index==cur) data=curData;
            else if(index==prev || index==next) data=secondaryData;
            else data=otherData;

            var offset=Offset(0, 0);
            if(index==prev) offset=Offset(-offsetH, 0);
            else if(index==next) offset=Offset(offsetH,0);

            return Transform.translate(
                offset: offset,
                child: Transform.scale(
                  scale: data['scale'],
                  child: Opacity(
                    opacity: data['opacity'],

                    child: Container(
                      width: W,
                      height: H,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screen.calc(10)),
                        boxShadow: [//添加阴影
                          BoxShadow(
                            color: Color(0x66000000),   //半透明
                            blurRadius: screen.calc(20),//半径
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screen.calc(10)),
                        child: Column(//自带居中效果
                          crossAxisAlignment: CrossAxisAlignment.start,//左对齐
                          children: [
                            Image.asset(item['img'], width: screen.calc(344), height: screen.calc(344),),
                            Padding(
                              padding: EdgeInsets.only(top: screen.calc(18), left: screen.calc(16), right: screen.calc(16)),
                              child: Text(item['title'], maxLines: 2, style: TextStyle(
                                fontSize: screen.calc(23),
                              )),
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                )
            );
          }).toList(),
        ),
      ),
    );
  }

}