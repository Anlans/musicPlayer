import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

class Playing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final screen=Screen(context);

    return Hero(//右上组件的穿越
      tag: 'right_top_playing_icon',
      child: Container(
        height: screen.calc(60),
        width: screen.calc(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screen.calc(30)),
          border: Border.all(width: screen.calc(3), color: Color(0xffe5e5e5)),
          image: DecorationImage(
            image: AssetImage('assets/tmp_icon_music.png'),
          ),
        ),
      ),
    );
  }
}