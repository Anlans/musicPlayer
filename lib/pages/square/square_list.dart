import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/home/home.dart';



class SquareList extends StatelessWidget{
  final List<Map> items;

  const SquareList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getSongListSquare();
    final screen=Screen(context);
    // print(items.length);
    final rows=[];

    for(var i=0; i<items.length; i+=3){
      rows.add(items.sublist(i, i+3));
    }

    // print(rows);//数组套数组

    return Container(
      margin: EdgeInsets.only(top: screen.calc(2)),
      padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),//左右
      child: Column(
        children: rows.map((row)=>
          Container(
            margin: EdgeInsets.only(top: screen.calc(36)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,//均分三个Container容器
              children: row.map<Widget>((item)=>Container(
                width: screen.calc(214),
                height: screen.calc(300),
                child: Column(
                  children: [
                    Image.network(
                      item['img'],
                      width: screen.calc(214),
                      height: screen.calc(214),
                      fit: BoxFit.fill,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: screen.calc(8)),

                      child: Text(item['title'], maxLines: 2, style: TextStyle(
                        fontSize: screen.calc(24),
                      ),),
                    )
                  ],
                ),
              ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

}