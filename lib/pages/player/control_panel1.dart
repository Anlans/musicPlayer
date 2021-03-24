import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/img_button.dart';

class ControlPanel1 extends StatelessWidget{
  final bool heart;
  final VoidCallback onHeart;
  final VoidCallback onUnHeart;
  final VoidCallback onDownload;
  final VoidCallback onBell;

  ControlPanel1({
    Key key,
    this.heart=false,
    this.onDownload,
    this.onHeart,
    this.onUnHeart,
    this.onBell,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final disableOpacity=.5;//按钮透明度，无法使用时的变暗
    // final args=ModalRoute.of(context).settings.arguments as Map;

    // print(args);

    return Container(
      height: screen.calc(55),
      margin: EdgeInsets.only(bottom: screen.calc(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//平均排列
        children: [
          Center(
            child: heart?
            GestureDetector(
              onTap: onUnHeart,
              child: Image.asset('assets/icon-heart-w-fill.png', width: screen.calc(55), height: screen.calc(55),),
            ):
            GestureDetector(
              onTap: onHeart,
              child: Image.asset('assets/icon-heart-w.png', width: screen.calc(55), height: screen.calc(55),),
            ),
          ),
          Center(
            child: ImgButton(
              'assets/icon-download-w.png',
              onTap: onDownload,
              width: screen.calc(55), height: screen.calc(55),
            ),
          ),
          Center(
            child: ImgButton(
              'assets/icon-bell-w.png',
              onTap: onBell,
              width: screen.calc(55), height: screen.calc(55),
            ),
          ),
          Center(
            child: Image.asset('assets/icon-message-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
          Center(
            child: Image.asset('assets/icon-3dot-w.png', width: screen.calc(55), height: screen.calc(55),),
          ),
        ],
      ),
    );
  }

}