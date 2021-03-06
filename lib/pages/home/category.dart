import 'package:flutter/material.dart';
import 'package:musicplayer/pages/home/home.dart';
import 'package:musicplayer/service/common.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/main.dart';

class Category extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // getSongListDetail();//该函数之内已经调用getSongList();所以无需再调用getSongList()
    final screen=Screen(context);
    const items=[
      {'title': '每日推荐', 'img':'assets/cate_1.png'},
      {'title': '歌单', 'img':'assets/cate_4.png'},
      {'title': '排行榜', 'img':'assets/cate_6.png'},
      {'title': '直播', 'img':'assets/cate_11.png'},
      {'title': '电台', 'img':'assets/cate_22.png'},
      {'title': '火前', 'img':'assets/cate_32.png'},
      {'title': '其他', 'img':'assets/cate_33.png'},
    ];

    return Container(
      padding: EdgeInsets.only(left: screen.calc(24)),
      margin: EdgeInsets.only(top: screen.calc(32)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((item)=>GestureDetector(//手势识别 可以点击每个Container
            onTap: (){
              Navigator.pushNamed(context, '/square', arguments: {
                'from': item,
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: screen.calc(29)),
              width: screen.calc(108),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: screen.calc(92),
                      width: screen.calc(92),
                      decoration: BoxDecoration(
                        color: Color(0xfff3271c),
                        borderRadius: BorderRadius.circular(screen.calc(92)/2),
                      ),
                      child: Center(
                        child: Image.asset(item['img'], width: screen.calc(48),height: screen.calc(48),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: screen.calc(21)),
                      child: Text(item['title'], style: TextStyle(
                        fontSize: screen.calc(23),
                      ),),
                    )
                  ],
                ),
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }

}