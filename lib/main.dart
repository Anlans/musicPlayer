import 'package:flutter/material.dart';
import 'package:musicplayer/router.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/util/play_state.dart';

void main() {
  runApp(PlayStateProvider(
    child: App(),
  ));
  setStatusBarStyle(Brightness.light);
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'my first flutter',
      routes: routes,
      initialRoute: '/',
    );

  }
}

