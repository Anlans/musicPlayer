import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import 'package:musicplayer/pages/login/login_1.dart';
import 'package:musicplayer/pages/login/login_2.dart';
import 'package:musicplayer/pages/login/login_3.dart';
import 'package:musicplayer/pages/login/login_4.dart';
import 'package:musicplayer/pages/login/login_5.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/store.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/widgets/global_navigation_bar.dart';
import 'package:musicplayer/widgets/round_flat_button.dart';
import 'package:musicplayer/pages/login/login.dart';

class UserCenterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    setStatusBarStyle(Brightness.light);//状态栏亮色


    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screen.calc(470),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff979797),
                      Color(0xff616161),
                    ]
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: screen.top),
              child: Column(
                children: [
                  _QRScanner(),
                  _adHeader(),
                  _Content(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GlobalNavigationBar(     //底部导航栏
        value: 1,                                   //开启后默认所在页
      ),
    );
  }
}

class _QRScanner extends StatelessWidget{//扫码
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Container(
      padding: EdgeInsets.only(
        top: screen.calc(14),
        left: screen.calc(28),
        right:screen.calc(28),
        bottom: screen.calc(14),
      ),
      child: Row(
        children: [
          Image.asset('assets/icon-qr-code.png', width: screen.calc(42), height: screen.calc(42),),
        ],
      ),
    );
  }
}

class _adHeader extends StatelessWidget{//广告
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Container(
      margin: EdgeInsets.only(top: screen.calc(19)),
      child: Container(
        padding: EdgeInsets.only(left: screen.calc(39), right: screen.calc(39)),
        width: screen.calc(666),
        // height: screen.calc(260),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screen.calc(20)),
            topRight: Radius.circular(screen.calc(20)),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(.5),
              Colors.white.withOpacity(.05),
            ],
          ),
          border: Border.all(//凹凸感
            color: Colors.white.withOpacity(.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: screen.calc(30), bottom: screen.calc(36)),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text('开通VIP', style: TextStyle(
                          color: Color(0xfff8e3df),
                          fontSize: screen.calc(38),
                          fontWeight: FontWeight.bold,
                        ),),
                        Padding(
                          padding: EdgeInsets.only(top: screen.calc(10)),
                          child: Text('加入VIP,立享特权', style: TextStyle(
                            color: Color(0xffd7d7d7),
                            fontSize: screen.calc(22),
                          ),),
                        ),

                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: RoundFlatButton(
                      padding: EdgeInsets.zero,
                      bgColor: Color(0xffe4c9c4),
                      width: screen.calc(148),
                      height: screen.calc(52),
                      child: Text('会员中心', style: TextStyle(fontSize: screen.calc(23), color: Color(0xff6a6a6a)),),
                      onTap: (){},
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: screen.calc(22), bottom: screen.calc(23)),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text('愿你每天好心情', style: TextStyle(
                          color: Color(0xfff8e3df),
                          fontSize: screen.calc(26),
                          fontWeight: FontWeight.bold,
                        ),),
                        Padding(
                          padding: EdgeInsets.only(top: screen.calc(10)),
                          child: Text('体验HI-Fi音效, 感受优秀音乐氛围', style: TextStyle(
                            color: Color(0xffd7d7d7),
                            fontSize: screen.calc(22),
                          ),),
                        ),

                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: screen.calc(27)),
                          child: Image.asset('assets/hongbao.png', width: screen.calc(59), height: screen.calc(58),),
                        ),
                        Text('>', style: TextStyle(
                          color: Color(0xffd7d7d7),
                          fontSize: screen.calc(32),
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class _Content extends HookWidget{//内容
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final darkMode=useState(false);//默认白天模式
    return Container(
      // height: 500,
      width: screen.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screen.calc(40)),
          topRight: Radius.circular(screen.calc(40)),
        ),
      ),
      child:Column(
        children: [
          _ContentHeader(),
          _Spliter(),
          _List(
            items: [
              {'icon':Icon(Icons.lightbulb_outline), 'title': '创作者中心',},
            ]
          ),
          _Spliter(),
          _List(
            title: '音乐服务',
            items: [
              {'icon':Icon(Icons.email), 'title': '演出', 'tip': Row(
                children: [
                  Text('麦田音乐节 ', style: TextStyle(
                    color: Color(0xffa2a2a2),
                    fontSize: screen.calc(20),
                  ),),
                  _RedDot(),
                ],
              )},
              {'icon':Icon(Icons.lightbulb_outline), 'title': '商城', 'tip': Row(
                children: [
                  Text('商品', style: TextStyle(
                    color: Color(0xffa2a2a2),
                    fontSize: screen.calc(20),
                  )),
                  _RedDot(),
                ],
              )},
              {'icon':Icon(Icons.zoom_in), 'title': '口袋彩铃',},
              {'icon':Icon(Icons.voicemail), 'title': '在线听歌',},
            ]
          ),
          _Spliter(),
          _List(
            title: '小工具',
            items: [
              {'icon':Icon(Icons.settings), 'title': '设置',},
              {'icon':Icon(Icons.settings_applications_sharp), 'title': '夜间模式', 'right': Switch(
                value: darkMode.value,
                onChanged: (val){
                  darkMode.value=val;
                },
              )},
              {'icon':Icon(Icons.timer), 'title': '定时关闭',},
              {'icon':Icon(Icons.block), 'title': '音乐黑名单',},
              {'icon':Icon(Icons.cloud), 'title': 'aa音效', 'tip': Row(
                children: [
                  Text('麦田音乐节', style: TextStyle(
                    color: Color(0xffa2a2a2),
                    fontSize: screen.calc(20),
                  )),
                  _RedDot(),
                ],
              )},
              {'icon':Icon(Icons.alarm), 'title': '音乐闹钟',},
              {'icon':Icon(Icons.voicemail), 'title': '青少年模式',},
            ]
          ),
          _Spliter(),
          _List(
              items: [
                {'icon':Icon(Icons.alarm), 'title': '我的订单',},
                {'icon':Icon(Icons.alarm), 'title': '优惠',},
                {'icon':Icon(Icons.share), 'title': '分享',},
                {'icon':Icon(Icons.voicemail), 'title': '关于',},
              ]
          ),
          _Spliter(),
          _Footer(),
        ],
      ),
    );
  }
}

class _ContentHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Container(
      margin: EdgeInsets.only(top: screen.calc(39), bottom: screen.calc(26)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(20)),
                child: Image.asset('assets/tmp_avatar_1.png', width: screen.calc(70), height: screen.calc(70),),
              ),
              Text(Logining?globalNickname:'<未登录>', style: TextStyle(
                fontSize: screen.calc(28),
                fontWeight: FontWeight.w700,
              ),),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: screen.calc(32)),
                child: RoundFlatButton(
                  width: screen.calc(128),
                  height: screen.calc(52),
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icon-qiandao.png', width: screen.calc(28), height: screen.calc(26),),
                      Text(' 签到', style: TextStyle(
                        color: Colors.white,
                        fontSize: screen.calc(23),
                      ),)
                    ],
                  ),
                  bgColor: Color(0xfff33f32),
                  onTap: (){},
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screen.calc(61)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,//平均分配空间间隙
              children: [
                {'title': '我的消息', 'img': 'assets/icon-usercenter-1.png'},
                {'title': '我的好友', 'img': 'assets/icon-usercenter-2.png'},
                {'title': '个人主页', 'img': 'assets/icon-usercenter-3.png'},
                {'title': '我的主题', 'img': 'assets/icon-usercenter-4.png'},
              ].map((item)=>Container(
                child: Column(
                  children: [
                    Image.asset(item['img'], width: screen.calc(64), height: screen.calc(64),),
                    Padding(
                      padding: EdgeInsets.only(top: screen.calc(20)),
                      child: Text(item['title'], style: TextStyle(
                        fontSize: screen.calc(26),
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4646464),
                      ),),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
        
        ],
      ),
    );
  }
}

class _Spliter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      height: screen.calc(16),
      color: Color(0xfff8f8f7),
    );
  }
}




class _List extends StatelessWidget{
  final String title;
  final List<Map> items;

  _List({Key key, this.title, this.items}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Column(
      children: [
        //头
        title!=null?Container(
          padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
          alignment: Alignment.centerLeft,
          height: screen.calc(80),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              width: 1,
              color: Color(0xffe9e9e9),
            ))
          ),
          child: Text(title, style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: screen.calc(26),
          ),),
        ):Container(),
        //内容列表
        Column(
          children: items.asMap().map((index, item)=>MapEntry(
            index,
            _ListItem(
            item: item,
            hasBorder: index!=items.length-1,
          )
          )).values.toList(),
        )
      ],
    );
  }
}
class _ListItem extends StatelessWidget{
  final bool hasBorder;
  final Map item;


  @override
  _ListItem({Key key, this.hasBorder=true, this.item}):super(key:key);
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final H=screen.calc(100);
    final children=<Widget>[];

    //title
    children.add(Text(item['title'], style: TextStyle(
      fontSize: screen.calc(30),
    ),));

    //spacer
    children.add(Spacer());

    //tip?
    if(item.containsKey('tip')){
      children.add(item['tip']);
    }

    //> or right
    if(item.containsKey('right')){
      children.add(item['right']);
    }else{
      children.add(Container(
        width: screen.calc(35),
        height: screen.calc(35),
        child: Image.asset('assets/icon-right-arrow-cdcdcd.png',)
      ));
    }

    return Container(
      height: H,
      child: Row(
        children: [
          //图标
          Container(
            width: screen.calc(106),
            child: item['icon'],
          ),
          //
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: screen.calc(32)),
              height: H,
              decoration: BoxDecoration(
                border: hasBorder?Border(bottom:BorderSide(//去除最后一位的底边框
                  width: 1,
                  color: Color(0xffe8e8e8),
                )):null,
              ),
              child: Row(
                children: children,
              ),
            ),
          )
        ],

      ),
    );
  }
}


class _Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Container(
      alignment: Alignment.center,
      height: screen.calc(100),
      child: FlatButton(
        child: Text('退出登录', style: TextStyle(
          color: Color(0xffff4444),
          fontSize: screen.calc(32),
          fontWeight: FontWeight.w600,
        ),),
        onPressed: (){
          Logining=false;
          print('退出登录');
          Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }
}


class _RedDot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Container(
      width: screen.calc(19),
      height: screen.calc(19),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(screen.calc(10)),
      ),
    );
  }
}