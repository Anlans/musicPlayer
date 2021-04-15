import 'package:flutter/cupertino.dart';
import 'package:musicplayer/pages/splash/splash.dart';
import 'package:musicplayer/pages/home/home.dart';
import 'package:musicplayer/pages/square/square.dart';
import 'package:musicplayer/pages/player/player.dart';
import 'package:musicplayer/pages/login/login.dart';
import 'package:musicplayer/pages/user_center/user_center.dart';
import 'package:musicplayer/pages/comment/comment.dart';
import 'package:musicplayer/pages/songlist/listofsong.dart';



final routes={
  "/": (BuildContext context)=>SplashPage(),
  "/home": (BuildContext context)=>HomePage(),
  "/square": (BuildContext context)=>SquarePage(),
  "/player": (BuildContext context)=>PlayerPage(),
  "/login": (BuildContext context)=>LoginPage(),
  "/user-center": (BuildContext context)=>UserCenterPage(),
  "/comment": (BuildContext context)=>CommentPage(),
  "/songlist": (BuildContext context)=>SonglistPage(),
};