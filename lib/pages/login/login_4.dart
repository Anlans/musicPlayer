import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/header.dart';
import 'package:musicplayer/widgets/round_flat_button.dart';
//重设密码页面，设置昵称

class Login4 extends HookWidget{
  final onSubmit;

  Login4({Key key, this.onSubmit}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final password=useState('');

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: screen.top, left: screen.calc(32), right: screen.calc(32)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//居左
          children: [
            Header(
              title: '重设密码',
              
            ),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(90)),
              child: Text('设置密码后，可使用手机号+密码登录', style: TextStyle(
                fontSize: screen.calc(26),

              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: screen.calc(66)),
              height: screen.calc(84),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(//自制输入框底边
                  width: 1,
                  color: Color(0xffcccccc),
                )),
              ),
              child: TextField(
                onChanged: (val){
                  password.value=val;

                },
                style: TextStyle(
                  fontSize: screen.calc(32),
                ),
                decoration: InputDecoration(
                  hintText: '设置登录密码，不少于6位',
                  hintStyle: TextStyle(
                    color: Color(0xffcccccc),
                  ),
                  border: InputBorder.none,//去除输入框底部横线
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screen.calc(81)),
              child: RoundFlatButton(
                height: screen.calc(80),
                width: screen.calc(686),
                disabled: password.value.length<6,//密码长度小于6，true，则为不可选状态
                bgColor: Color(0xffeb5443),
                child: Text('完成', style: TextStyle(
                  color: Colors.white,
                ),),
                onTap: (){
                  onSubmit(password.value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}