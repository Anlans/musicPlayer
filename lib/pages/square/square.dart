import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/global_navigation_bar.dart';

class SquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments as Map;//可以从context里面拿东西
    var screen=Screen(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.top+screen.calc(7)),
        child: Column(
          children:[
            Text('广场'),
          ]
        ),
      ),
      bottomNavigationBar: GlobalNavigationBar(
        value: 2,
      ),
    );
  }

}