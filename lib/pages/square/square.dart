import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/pages/home/header.dart';
import 'package:musicplayer/pages/home/banner.dart';
import 'package:musicplayer/pages/home/category.dart';
import 'package:musicplayer/pages/square/square.dart';


class SquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments as Map;//可以从context里面拿东西
    var screen=Screen(context);

    print(args['from']);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.top+screen.calc(7)),
        child: Column(
          children:[
            Text('广场'),
          ]
        ),
      ),
    );
  }

}