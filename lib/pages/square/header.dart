import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/playing.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      padding: EdgeInsets.only(left: screen.calc(24), right: screen.calc(24)),
      height: screen.calc(72),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(//左箭头图标
              child: Image.asset('assets/icon-left-arrow.png',width: screen.calc(37),height: screen.calc(37),),
            ),
          ),

          Expanded(
            child: Center(
              child: Text('歌单广场', style: TextStyle(
                fontSize: screen.calc(34),
                fontWeight: FontWeight.w700,
              ),),
            ),
          ),
          Container(
            child: Playing(),
          )
        ],
      ),
    );
  }

}