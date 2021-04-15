import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/arc_progress.dart';
import 'package:musicplayer/util/play_state.dart';

//播放中状态小组件，右上角播放状态
class Playing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final screen=Screen(context);

    final playState=PlayState.of(context);


    final size=screen.calc(60);
    // final size=screen.calc(200);
    final borderWidth=screen.calc(3);
    // final borderWidth=screen.calc(30);

    var percent=0.0;

    if(playState.current!=null && playState.total!=null){
      percent=playState.current/playState.total;
    }

    return Hero(//右上组件的穿越
      tag: 'right_top_playing_icon',
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/player');
        },
        child: Container(
          width: size,
          height: size,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 3, top: 3),
                height: size-6,
                width: size-6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/tmp_icon_music.png'),//右上角播放图
                  ),
                  borderRadius: BorderRadius.circular(size/2),
                ),
              ),
              Positioned.fill(
                child: ArcProgress(
                  percent: percent,
                  width: borderWidth,
                  color: Color(0xffff3a3a),
                  bgColor: Color(0xffe5e5e5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Container(
// height: size,
// width: size,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(size/2),
// border: Border.all(width: borderWidth, color: Color(0xffe5e5e5)),
// image: DecorationImage(
// fit: BoxFit.fill,
// image: AssetImage('assets/tmp_icon_music.png'),
// ),
// ),
// ),