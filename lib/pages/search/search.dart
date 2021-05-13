import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/pages/player/player.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/widgets/header.dart';
import 'package:musicplayer/widgets/playing.dart';
import 'package:musicplayer/pages/home/home.dart';
import 'package:musicplayer/pages/home/header.dart';
import 'package:musicplayer/util/play_state.dart';

class SearchListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screen.top,
                left: screen.calc(32),
                right: screen.calc(32),
              ),
              child: Header(
                title: 'get',
                isHero: false,
                right: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Playing(),
                  ],
                ),
              ),
            ),
            _List(),
          ],
        ),
      ),
    );
  }
}


class _List extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final borderColor=Color(0xffe6e6e6);
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
          child: Column(
            children: searchList.map((item)=>_ListItem(
              id: item['id'],
              title: item['name'],
              artist: item['artist'],
              // active: activeID==item['id'],//使播放列表当前正在播放的歌曲红色
            )).toList(),
          ),
        ),
      ),
    );
  }
}


class _ListItem extends StatelessWidget{
  final String id;
  final String title;//歌曲名
  final String artist;//歌手
  // final bool active;//歌曲是否播放中（激活状态）

  _ListItem({Key key, this.id, this.title, this.artist}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final playState=PlayState.of(context);
    var res;

    return GestureDetector(
      onTap: ()async{
        // print('aaaaaaaaaaaaaaaaaa: $id');
        res = await getSgUrl(id);
        getComment(id);
        // recommendList1[0]['id']=id;
        // // recommendList1[0]['img']=;
        // recommendList1[0]['title']=title;
        // recommendList1[0]['artist']=artist;
        playState.player.play(res);
      },
      child: Container(
        height: screen.calc(89),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xffe6e6e6)),),
        ),
        child: Row(
          children: [
            Text.rich(TextSpan(children: [

              TextSpan(
                text: title,
                style: TextStyle(
                  fontSize: screen.calc(26),
                  fontWeight: FontWeight.w700,
                ),
              ),

              TextSpan(
                text: ' - $artist',
                style: TextStyle(
                  fontSize: screen.calc(22),
                ),
              ),

            ])),
          ],
        ),
      ),
    );
  }
}