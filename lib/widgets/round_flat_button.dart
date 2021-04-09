import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
//登录页面的按钮组件封装重用

class RoundFlatButton extends StatelessWidget{
  final Color color;
  final Color bgColor;
  final String title;
  final Widget child;
  final bool outline;
  final num height;
  final num width;
  final EdgeInsets padding;
  final onTap;
  final bool disabled;//输入是否正确

  RoundFlatButton({
    Key key,
    this.color=Colors.black,
    this.bgColor=Colors.white,
    this.title,
    this.outline=false,
    this.child,
    this.width=100.0,
    this.height=100.0,
    this.padding,
    this.onTap,
    this.disabled=false,//对于输入手机号正确格式检查,false默认可以点击
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // print(this.child);

    assert(this.child==null || title==null);

    Widget child;

    if(this.child==null){
      child=Text(
        title,
        style: TextStyle(
          color: color,
        ),
      );
    }else{
      child=this.child;
    }

    final shape=RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(height/2),
    );
    var button;

    if(outline){
      button=OutlineButton(
        highlightColor: disabled?bgColor:null,//点击效果不变
        splashColor: disabled?bgColor:null,//模仿disable无法点击效果
        shape: shape,
        borderSide: BorderSide(color: color, width: 2),
        highlightedBorderColor: color,
        child: child,
        padding: padding,
        onPressed: disabled?(){}:onTap,
      );
    }else{
      button=FlatButton(
        highlightColor: disabled?bgColor:null,//点击效果不变
        splashColor: disabled?bgColor:null,//模仿disable无法点击效果
        shape: shape,
        color: bgColor,
        child: child,
        padding: padding,
        onPressed: disabled?(){}:onTap,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: Opacity(
        opacity: disabled?0.6:1,
        child: button,
      ),
    );
  }
}