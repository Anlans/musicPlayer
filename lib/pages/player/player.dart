import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/player/header.dart';
import 'package:musicplayer/pages/player/player_inner.dart';
import 'package:musicplayer/pages/player/control_panel1.dart';
import 'package:musicplayer/pages/player/control_panel2.dart';
import 'package:musicplayer/pages/player/progress.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/util/play_state.dart';

class PlayerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final args=ModalRoute.of(context).settings.arguments as Map;
    final playState=PlayState.of(context);
    // final playing=useState(false);//是否播放状态
    // final player=getPlayer();//对player做实例

    setStatusBarStyle(Brightness.light);

    return Scaffold(
      body: Stack(
        children: [//唱片机背景模糊图
          Image.asset('assets/tmp_cover_7.jpg', height: screen.height, width: screen.width, fit: BoxFit.fill,),//和屏幕一般高，但会被父级宽度限制，所以需要fit

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX:60, sigmaY:60),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),//背景图叠在下面

          Container(
            padding: EdgeInsets.only(top: screen.top, left: screen.calc(24), right: screen.calc(24)),

            child: Column(
              children: [
                Header(),
                PlayerInner(playing: playState.playing,),//大盘子

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: screen.width,
            child: Container(
              child: Column(
                children: [
                  ControlPanel1(
                    heart: false,
                    onDownload: (){
                      print('down');
                    },
                  ),
                  Progress(
                    current: playState.current!=null?playState.current:null,
                    total: playState.total!=null?playState.total:null,),
                  ControlPanel2(
                    playing: playState.playing,
                    onPlayTap: (){
                      playState.player.play('http://aq.webturing.com/wp-content/uploads/2021/03/tstMusic.mp3');
                      //播放时设为true，图标显示为pause
                    },
                    onPauseTap: (){
                      playState.player.pause();
                      //播放时设为false，图标显示为play
                    },

                    onPlaylist: (){
                      print('playlist');
                    },
                    onBackward: (){
                      print('back');
                    },
                    onForward: (){
                      print('forward');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}