import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

const items=[
  {},
];

class BannerSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    
    return Container(
      margin: EdgeInsets.only(top: screen.calc(38)),
      child: CarouselSlider(//下载的carousel_slider工具
        options: CarouselOptions(
          initialPage: 0,//从第0页开始滚动
        ),
        items: [
          //容器： 294*374原图 344*438放大后
          //图片： 294*294
          Container(
            width: screen.calc(294),
            height: screen.calc(374),
            child: Column(//上下结构
              children: [
                Image.asset('assets/tmp_square_cover_1.png', width: screen.calc(294), height: screen.calc(294),),
                Text('请保持眉梢欢悦，因为有人等着你对视'),
              ],
            ),
          )
        ],
      ),
    );
  }

}