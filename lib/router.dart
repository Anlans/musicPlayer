import 'package:flutter/cupertino.dart';
import 'package:musicplayer/pages/splash/splash.dart';
import 'package:musicplayer/pages/home/home.dart';
import 'package:musicplayer/pages/square/square.dart';

final routes={
  "/": (BuildContext context)=>SplashPage(),
  "/home": (BuildContext context)=>HomePage(),
  "/square": (BuildContext context)=>SquarePage(),
};