import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/round_flat_button.dart';
import 'package:musicplayer/widgets/header.dart';
//手机号登录页面
class Login2 extends StatelessWidget{
  final onNext;
  Login2({Key key, this.onNext}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Scaffold(//脚手架必须，否则会默认状态
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: screen.top, left: screen.calc(32), right: screen.calc(32)),
          child: Column(
            children: [
              Header(
                title: '绑定手机号',
              ),//使用login内部的header.dart
              Padding(
                padding: EdgeInsets.only(top: screen.calc(72)),
                child: Center(
                  child: Image.asset('assets/login_img_1.png', width: screen.calc(344), height: screen.calc(311),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screen.calc(10)),
                child: Text('绑定手机号,让你的账号更安全', style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: screen.calc(26)
                ),),
              ),
              _Content(
                onNext: onNext,//给你了，好好珍惜我的onNext
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _Content extends HookWidget{

  final onNext;
  _Content({Key key, this.onNext}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    final items=[
      '+86', '+78', '+12', '+88',
    ];
    final curArea=useState(items[0]);
    final validate=useState(false);//拿到是否启用的状态

    // final controller=TextEditingController(text: curText.value);//每输入一个字都得有些反应，监听

    final controller=useState(TextEditingController());//利用其可以跨越build来存储数据（HookWidget自身buff）

    controller.value.addListener(() {//controller在build的时候会被重建
      var re=r"^1\d{10}$";//此处以1开头，并且后带10个数字，总共11个数字才可组成合格手机号格式
      // print(controller.value.value.text);//拿到输入的值
      // print(RegExp(re).hasMatch(controller.value.text));
      validate.value=RegExp(re).hasMatch(controller.value.value.text);
    });
    

    return Container(
      margin: EdgeInsets.only(top: screen.calc(72)),
      child: Column(
        children: [

          Container(
            child: Row(
              children: [
                DropdownButton(
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: screen.calc(32),
                  ),
                  value: curArea.value,
                  onChanged: (val){
                    curArea.value=val;
                  },
                  items:items.map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  )).toList(),
                ),
                Expanded(
                  child: TextField(
                    controller: controller.value,
                    style: TextStyle(
                      fontSize: screen.calc(30),

                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,//去除输入框底部灰边
                    ),
                    keyboardType: TextInputType.phone,//使用数字键盘
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: screen.calc(61)),
            child: RoundFlatButton(
              disabled: !validate.value,//默认禁用，即不允许点击
              width: screen.calc(686),
              height: screen.calc(80),
              bgColor: Color(0xffea4331),
              child: Text('下一步', style: TextStyle(
                color: Colors.white,
                fontSize: screen.calc(32),
              ),),
              onTap: (){
                onNext(
                  curArea.value,
                  controller.value.value.text,
                );//添加一个事件把值传给父级
              },
            ),
          ),
        ],
      ),
    );
  }
}