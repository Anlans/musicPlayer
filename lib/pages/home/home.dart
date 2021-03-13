import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/home/header.dart';
import 'package:musicplayer/pages/home/banner.dart';
import 'package:musicplayer/pages/home/category.dart';
import 'package:musicplayer/pages/square/square.dart';
import 'package:musicplayer/widgets/song_list.dart';
import 'package:musicplayer/widgets/recommend_list.dart';
import 'package:musicplayer/widgets/global_navigation_bar.dart';

const songList1=[
  {'id': '43423', 'img': 'assets/tmp_cover_1.jpg', 'count': '9亿', 'title': '[华语新歌] 最新华语音乐专辑'},
  {'id': '666', 'img': 'assets/tmp_cover_2.jpg', 'count': '34.9亿', 'title': '今天从<Titan>听起|私人雷达'},
  {'id': '231', 'img': 'assets/tmp_cover_3.jpg', 'count': '5335', 'title': '[美语新歌]'},
  {'id': '333', 'img': 'assets/tmp_cover_4.jpg', 'count': '19万', 'title': '[韩语新歌]'},
  {'id': '788', 'img': 'assets/tmp_cover_5.jpg', 'count': '3232', 'title': '[日语新歌]'},
  {'id': '344', 'img': 'assets/tmp_cover_6.jpg', 'count': '20亿亿', 'title': '[泰语新歌]'},
];

const recommendList1=[
  {'id':'1111', 'img': 'assets/tmp_cover_1.jpg', 'title': 'Tempest', 'artist': 'Capo　Productions', 'tip':'眸中衍生星辰 于吾却尽是沙漠'},
  {'id':'1111', 'img': 'assets/tmp_cover_2.jpg', 'title': '岁月神偷', 'artist': '金玟岐', 'tip':'于吾却尽是沙漠'},
  {'id':'1111', 'img': 'assets/tmp_cover_3.jpg', 'title': '最美的期待', 'artist': '周笔畅', 'tip':'眸中衍生星辰 于吾却尽是沙漠'},
  {'id':'1111', 'img': 'assets/tmp_cover_4.jpg', 'title': 'Tempest', 'artist': 'Capo　Productions', 'tip':'眸中衍生星辰 于吾却尽是沙漠'},
  {'id':'1111', 'img': 'assets/tmp_cover_5.jpg', 'title': 'Tempest', 'artist': 'Capo　Productions', 'tip':'眸中衍生星辰 于吾却尽是沙漠'},
  {'id':'1111', 'img': 'assets/tmp_cover_6.jpg', 'title': 'Tempest', 'artist': 'Capo　Productions', 'tip':'眸中衍生星辰 于吾却尽是沙漠'},
];


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

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
                }, items: songList1,),

                RecommendList(title: '根据 Red 推荐', items: recommendList1, onMore: (){
                  print('more');
                }, onPlay: (id){
                  print('play: $id');
                },),
                Container(
                  height: screen.calc(100),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GlobalNavigationBar(
        value: 0,
      ),//底部导航栏
    );
  }

}