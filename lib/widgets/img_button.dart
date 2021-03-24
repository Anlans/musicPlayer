import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
//重用播放歌曲页面的下方图片按钮

final _disableOpacity=0.5;

class ImgButton extends StatelessWidget{
  final VoidCallback onTap;
  final String assetName;
  final width;
  final height;

  ImgButton(this.assetName,{
    Key key,
    this.width=50,
    this.height=50,
    this.onTap,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return onTap!=null?
    GestureDetector(
      onTap: onTap,
      child: Image.asset(assetName, width: width, height: height),
    ):
    Opacity(
      opacity: _disableOpacity,
      child: Image.asset(assetName, width: width, height: height,),
    );
  }
}