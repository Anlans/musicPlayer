import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

class Progress extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final args=ModalRoute.of(context).settings.arguments as Map;

    print(args);

    return Container(
      height: screen.calc(30),
      child: Container(

      ),
    );
  }

}