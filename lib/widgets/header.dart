import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
//针对于登陆模块，登录以及验证模块的Header的封装可重用
class Header extends StatelessWidget{
  final String title;
  final Widget right;
  final bool isHero;

  Header({Key key, this.title, this.right, this.isHero=true}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final child=Container(
      height: screen.calc(88),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: screen.calc(200),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);//返回上一页面
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  inherit: false,//避免Hero切换页面字体变换
                  color: Color(0xff333333),
                  fontSize: screen.calc(34),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: screen.calc(200),
            child: right,
            // child: Icon(Icons.share),
          ),

        ],
      ),
    );


    if(isHero){
      return Hero(
        tag: '_login_page_header',
        child: child,
      );
    }else{
      return child;
    }

  }
}