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

class UserCenterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screen.calc(440),
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

          Container(),
        ],
      ),
    );
  }
}