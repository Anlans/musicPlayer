import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/home/header.dart';
import 'package:musicplayer/pages/home/banner.dart';
import 'package:musicplayer/pages/home/category.dart';
import 'package:musicplayer/pages/square/square.dart';
import 'package:musicplayer/widgets/song_list.dart';
import 'package:musicplayer/widgets/song_list.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen=Screen(context);

    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(
          color: Color(0xff333333),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: screen.top+screen.calc(7)),
            child: Column(
              children: [
                Header(),
                MyBanner(),
                Category(),
                SongList(title: '你的歌单精选站', onMore: (){
                  Navigator.pushNamed(context, '/square');
                }, items: [
                {'id': '43423', 'img': 'assets/tmp_cover_1.jpg', 'count': '9亿', 'title': '[华语新歌] 最新华语音乐专辑'},
                {'id': '666', 'img': 'assets/tmp_cover_2.jpg', 'count': '34.9亿', 'title': '今天从<Titan>听起|私人雷达'},
                {'id': '231', 'img': 'assets/tmp_cover_3.jpg', 'count': '5335', 'title': '[美语新歌]'},
                {'id': '333', 'img': 'assets/tmp_cover_4.jpg', 'count': '19万', 'title': '[韩语新歌]'},
                {'id': '788', 'img': 'assets/tmp_cover_5.jpg', 'count': '3232', 'title': '[日语新歌]'},
                {'id': '344', 'img': 'assets/tmp_cover_6.jpg', 'count': '20亿亿', 'title': '[泰语新歌]'},
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }

}