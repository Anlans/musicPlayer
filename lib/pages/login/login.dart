import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import 'package:musicplayer/pages/login/login_1.dart';
import 'package:musicplayer/pages/login/login_2.dart';
import 'package:musicplayer/pages/login/login_3.dart';
import 'package:musicplayer/pages/login/login_4.dart';
import 'package:musicplayer/pages/login/login_5.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/store.dart';

class LoginPage extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context).settings.arguments;//用路由的参数来传递
    final dispatch=useDispatch<StoreState>();

    var step=1;
    if(args!=null){//没参数就统一按照1算，否则按照传值来走
      step=(args as Map)['step'];
    }

    final steps={
      1: Login1(//此处不用路由，只用换组件的方式
        onLogin: (){
          // step.value++;//进入Login2
          Navigator.pushNamed(context, '/login', arguments: {
            'step': 2,
          });
        },

        onCancel: (){},
        onWechat: (){},
        onQQ: (){},
        onWeibo: (){},
        onApple: (){},
        onEasy: (){},
      ),
      2: Login2(onNext: (area, phone){
        // print(area);
        // print(phone);
        Navigator.pushNamed(context, '/login', arguments: {
          'step': 3,
        });
      },),
      3: Login3(
        onFinished: (code){
          print(code);

          Navigator.pushNamed(context, '/login', arguments: {
            'step': 4,
          });
        },
      ),//跳到验证码验证
      4: Login4(onSubmit: (password){
        print(password);

        Navigator.pushNamed(context, '/login', arguments: {
          'step': 5,
        });
      },),
      5: Login5(onSubmit: (nickname){
        print(nickname);

        //完成注册
        dispatch(StoreAction(
          StoreActionType.UserLogin,
          nickname
        ));
        Navigator.pushNamed(context, '/home');
      },),
    };

    return steps[step];//找当前为第几步
  }
}