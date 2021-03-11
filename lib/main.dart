import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:musicplayer/pages/splash/splash.dart';
import 'package:musicplayer/pages/home/home.dart';

void main() {
  runApp(App())
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'my first flutter',
      routes: {
        "/": (context)=>SplashPage(),
        "/home": (context)=>HomePage(),
      },
      initialRoute: '/',
    );

  }
}