import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/header.dart';
import 'package:musicplayer/pages/login/login.dart';
//验证码验证页面
// ignore: must_be_immutable
class Login3 extends StatelessWidget{
  final onFinished;

  Login3({Key key, this.onFinished}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: screen.top, left: screen.calc(32), right: screen.calc(32)),
            child: Column(
              children: [
                Header(title: '绑定手机号'),
                _VerifiCode(),
                _Inputs(onFinished: this.onFinished),
              ],
            ),
          )
      ),
    );
  }
}


class _VerifiCode extends HookWidget{
  Timer timer;

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final time=useState(60);

    var timeout;

    if(time.value<=0){
      timeout=true;

      if(timer!=null){
        timer.cancel();
      }
    }else{
      timeout=false;

      if(timer!=null){
        timer.cancel();
      }
      timer=Timer(Duration(seconds: 1), (){
        time.value--;
      });
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: screen.calc(116)),
          child: Text('验证码已发送至', style: TextStyle(
            fontSize: screen.calc(34),
            fontWeight: FontWeight.w700,
          )),
        ),
        Container(
          margin: EdgeInsets.only(top: screen.calc(30)),
          child: Row(
            children: [
              Text('+86 $rigPhone', style: TextStyle(
                fontSize: screen.calc(26),
                color: Color(0xffa7a7a7),
              )),
              Spacer(),
              timeout?
              FlatButton(
                child: Text('重新发送', style: TextStyle(
                  color: Colors.blue,
                )),
                onPressed: (){
                  print('重新发送');
                  time.value=60;
                },
              ):Text('${time.value}S', style: TextStyle(
                fontSize: screen.calc(26),
                color: Color(0xffa7a7a7),
              )),
            ],
          ),
        )
      ],
    );
  }
}

class _Inputs extends HookWidget{
  final onFinished;

  _Inputs({Key key, this.onFinished}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final inputValues=useState(['', '', '', '']);

    List<Widget> inputs=[];
    // List<FocusNode> nodes=[];
    for(var i=0;i<4;i++){
      inputs.add(Expanded(
        child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                width: screen.calc(4),
                color: inputValues.value[i]==''?Color(0xffb2b2b2):Color(0xff2e2e2e),
              )),
            ),
            child: TextField(
              autofocus: i==0,
              onChanged: (val){
                var arr=inputValues.value.toList();
                arr[i]=val;


                if(i==3){
                  FocusScope.of(context).unfocus();
                  onFinished(arr.join(''));
                }else{
                  FocusScope.of(context).nextFocus();
                }


                inputValues.value=arr;
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screen.calc(36),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            )
        ),
      ));

      inputs.add(Container(width: screen.calc(35)));
    }
    inputs.removeAt(inputs.length-1);

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: screen.calc(128)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: inputs,
            ),
          ),
        ],
      ),
    );
  }
}



