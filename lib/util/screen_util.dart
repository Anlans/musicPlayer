import 'package:flutter/material.dart';

//设计图宽度
const _Width=750;

class Screen{
  var screen;
  var width,height,top;

  Screen(BuildContext context) {
    screen=MediaQuery.of(context);

    width=screen.size.width;
    height=screen.size.height;
    top=screen.padding.top;
  }

  double calc(double value){
    return value*screen.size.width/_Width;
  }
}