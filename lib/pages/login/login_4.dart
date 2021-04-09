import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/login/header.dart';
//重设密码页面，设置昵称

class Login4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: screen.top),
        child: Column(
          children: [
            Header(
              title: '重设密码',

            ),
          ],
        ),
      ),
    );
  }
}