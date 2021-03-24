import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/img_button.dart';

class ControlPanel2 extends StatelessWidget{
  final VoidCallback onBackward;//添加事件
  final VoidCallback onForward;//添加事件
  final VoidCallback onPlaylist;//添加事件
  final VoidCallback onPlayTap;//添加事件
  final VoidCallback onPauseTap;//添加事件
  final bool playing;//判断暂停还是播放状态

  ControlPanel2({
    Key key,
    this.onBackward,
    this.onForward,
    this.onPlaylist,
    this.playing,
    this.onPauseTap,
    this.onPlayTap,
  }):super(key:key);


  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final disableOpacity=.5;//按钮透明度，无法使用时的变暗
    // final args=ModalRoute.of(context).settings.arguments as Map;

    // print(args);

    return Container(
      margin: EdgeInsets.only(bottom: screen.calc(32), top: screen.calc(14)),
      height: screen.calc(120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//平均排列
        children: [
          Center(
            child: Image.asset('assets/icon-playloop-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: ImgButton(
              'assets/icon-backward-w.png',
              onTap: onBackward,
              width: screen.calc(55), height: screen.calc(55),
            ),
          ),


          Container(
            height: screen.calc(120),
            width: screen.calc(120),
            decoration: BoxDecoration(
              border: Border.all(width: screen.calc(2), color: Colors.white),
              borderRadius: BorderRadius.circular(screen.calc(60)),
            ),
            child: Center(
              child: playing?
                GestureDetector(
                  onTap: onPauseTap,
                  child: Image.asset('assets/icon-pause-w.png', width: screen.calc(55), height: screen.calc(55),),
                ):
                GestureDetector(
                  onTap: onPlayTap,
                  child: Image.asset('assets/icon-play-w.png', width: screen.calc(55), height: screen.calc(55),),
                ),
            ),
          ),

          Center(
            child: ImgButton(
              'assets/icon-forward-w.png',
              onTap: onForward,
              width: screen.calc(55), height: screen.calc(55),
            ),
          ),
          Center(
            child: ImgButton(
              'assets/icon-playlist-w.png',
              onTap: onPlaylist,
              width: screen.calc(55), height: screen.calc(55),
            ),
            // Image.asset('assets/icon-playlist-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
        ],
      ),
    );
  }

}