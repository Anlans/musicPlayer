import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/player/header.dart';
import 'package:musicplayer/pages/player/player_inner.dart';
import 'package:musicplayer/pages/player/control_panel1.dart';
import 'package:musicplayer/pages/player/control_panel2.dart';
import 'package:musicplayer/pages/player/progress.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/util/player_util.dart';

class PlayerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final args=ModalRoute.of(context).settings.arguments as Map;

    setStatusBarStyle(Brightness.light);

    print(args);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.top, left: screen.calc(24), right: screen.calc(24)),
        decoration: BoxDecoration(
          color: Color(0x99000000),
        ),
        child: Column(
          children: [
            Header(),
            PlayerInner(),
            ControlPanel1(),
            Progress(),
            ControlPanel2(),
          ],
        ),
      ),
    );
  }

}