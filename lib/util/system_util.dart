//操作系统主题系统工具的样式
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void setStatusBarStyle(Brightness iconStyle){//干掉系统状态栏//确定主题状态栏颜色
  if(Platform.isAndroid){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: iconStyle,
    ));
  }
}