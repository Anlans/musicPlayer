import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/round_flat_button.dart';

class Login1 extends StatelessWidget{
  final VoidCallback onLogin;
  final VoidCallback onCancel;
  final VoidCallback onWechat;
  final VoidCallback onQQ;
  final VoidCallback onWeibo;
  final VoidCallback onApple;
  final VoidCallback onEasy;

  Login1({
    Key key,
    this.onLogin,
    this.onCancel,
    this.onWechat,
    this.onQQ,
    this.onWeibo,
    this.onApple,
    this.onEasy,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Scaffold(
      body: Container(
        color: Color(0xffc93e2d),
        width: screen.width,
        height: screen.height,

        child: Stack(
          children: [
            Container(
              width: screen.width,
              child: Column(
                children: [
                  Container(
                    width: screen.calc(149),
                    height: screen.calc(148),
                    margin: EdgeInsets.only(top: screen.calc(312)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screen.calc(148/2)),
                      color: Color(0xffde4033),
                      image: DecorationImage(
                        image: AssetImage('assets/icon-login-logo.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screen.calc(202)),
                    child: Column(
                      children: [
                        RoundFlatButton(
                          child: Text('手机号登录', style: TextStyle(
                            color: Color(0xffea4d44),
                            fontSize: screen.calc(32),
                          )),
                          bgColor: Colors.white,
                          width: screen.calc(556),
                          height: screen.calc(92),
                          onTap: onLogin,
                        ),

                        Container(
                          height: screen.calc(36),
                        ),

                        RoundFlatButton(
                          outline: true,
                          child: Text('立即体验', style: TextStyle(
                            color: Colors.white,
                            fontSize: screen.calc(32),
                          )),
                          color: Colors.white,
                          width: screen.calc(556),
                          height: screen.calc(92),
                          onTap: onCancel,
                        ),

                        Container(
                          height: screen.calc(77),
                        ),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.white.withOpacity(.4),
                                ),
                                child: Checkbox(
                                  value: false,
                                  onChanged: (val){},
                                )
                              ),
                              Text('同意', style: TextStyle(
                                color: Colors.white.withOpacity(.4),
                              )),

                              Text('《服务条款》', style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                              )),

                              Text('《隐私政策》', style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                              )),

                              Text('《儿童隐私政策》', style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                              )),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            Positioned(
              bottom: screen.calc(72),
              width: screen.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                    child: RoundFlatButton(
                      child: Image.asset('assets/icon-wechat.png'),
                      bgColor: Colors.white,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                      onTap: onWechat,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                    child: RoundFlatButton(
                      child: Image.asset('assets/icon-qq.png'),
                      bgColor: Colors.white,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                      onTap: onQQ,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                    child: RoundFlatButton(
                      child: Image.asset('assets/icon-weibo.png'),
                      bgColor: Colors.white,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                      onTap: onWeibo,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                    child: RoundFlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon-apple.png',
                            width: screen.calc(32),
                            height: screen.calc(32),
                          ),
                          Text('通过Apple登录'),
                        ],
                      ),
                      bgColor: Colors.white,
                      width: screen.calc(280),
                      height: screen.calc(68),
                      padding: EdgeInsets.zero,
                      onTap: onApple,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                    child: RoundFlatButton(
                      child: Image.asset('assets/icon-easy.png'),
                      bgColor: Colors.white,
                      width: screen.calc(72),
                      height: screen.calc(72),
                      padding: EdgeInsets.zero,
                      onTap: onEasy,
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




