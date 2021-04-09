import 'package:flutter/material.dart';

import 'package:musicplayer/pages/login/login_1.dart';
import 'package:musicplayer/pages/login/login_2.dart';
import 'package:musicplayer/pages/login/login_3.dart';
import 'package:musicplayer/pages/login/login_4.dart';
import 'package:musicplayer/pages/login/login_5.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final step=useState(1);
    final steps={
      1: Login1(//此处不用路由，只用换组件的方式
        onLogin: (){
          step.value++;//进入Login2
        },
        onCancel: (){},
        onWechat: (){},
        onQQ: (){},
        onWeibo: (){},
        onApple: (){},
        onEasy: (){},
      ),
      2: Login2(),
    };

    return steps[step.value];//找当前为第几步
  }
}