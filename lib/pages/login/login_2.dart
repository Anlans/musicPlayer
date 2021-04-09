import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

class Login2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Scaffold(//脚手架必须，否则会默认状态
      body: Container(
        padding: EdgeInsets.only(top: screen.top, left: screen.calc(32), right: screen.calc(32)),
        child: Column(
          children: [
            _Header(),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(72)),
              child: Center(
                child: Image.asset('assets/login_img_1.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(10)),
              child: Text('绑定手机号,让你的账号更安全', style: TextStyle(
                  color: Color(0xff999999),
                  fontSize: screen.calc(26)
              ),),
            ),
            _Content(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      height: screen.calc(88),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: screen.calc(100),
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
                '绑定手机号',
                style: TextStyle(
                  fontSize: screen.calc(34),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: screen.calc(100),
            child: Icon(Icons.share),
          ),

        ],
      ),
    );
  }
}

class _Content extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Text('a');
  }
}