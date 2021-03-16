import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

const items=[
  {'id': 0, 'title': '推荐', 'color': null},
  {'id': 1, 'title': '官方', 'color': null},
  {'id': 2, 'title': '精品', 'color': 0xffe7aa5a},
  {'id': 3, 'title': '电子', 'color': null},
  {'id': 4, 'title': '欧美', 'color': null},
  {'id': 5, 'title': '经典', 'color': null},
  {'id': 6, 'title': '民谣', 'color': null},
  {'id': 7, 'title': '金属', 'color': null},
  {'id': 8, 'title': '公路', 'color': null},
  {'id': 9, 'title': '日韩', 'color': null},

];

typedef fnChanged=void Function(int);

class Category extends StatelessWidget{
  final int value;
  final fnChanged onChanged;
  final List<Map> items;

  Category({Key key, this.value=0, this.onChanged, this.items}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(30),),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffbcbab9), width: screen.calc(1)))//边框底线灰色
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,


        child: Container(
          padding: EdgeInsets.only(left: screen.calc(2), right: screen.calc(2)),
          child: Row(
            //循环生成
            children: items.map((item)=>GestureDetector(
              onTap: (){
                onChanged(item['id']);
              },
              child: Container(
                padding: EdgeInsets.only(
                  bottom: (value==item['id'])?screen.calc(23-4.0):screen.calc(23-4.0),
                ),
                margin: EdgeInsets.only(left: screen.calc(18), right: screen.calc(18)),//各字之间空开
                alignment: Alignment.topCenter,
                // height: screen.calc(34+23.0),//padding在高度里面减去，所以需要加上
                width: screen.calc(83),
                decoration: BoxDecoration(//底部的红边
                  border: (value==item['id'])?Border(bottom: BorderSide(
                    color: Color(0xffff3a3a),
                    width: screen.calc(4),
                  )):null,
                ),

                child: Text(item['title'], style: TextStyle(
                  fontSize: screen.calc(28),//
                  color: value==item['id']?Color(0xffff3a3a):(
                      item['color']!=null?Color(item['color']):Color(0xff2b2b2b)
                  ),
                  fontWeight: FontWeight.w700,
                ),),
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }

}