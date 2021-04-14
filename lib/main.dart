import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:musicplayer/router.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:musicplayer/store.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/util/play_state.dart';

import 'package:musicplayer/util/request.dart';
import 'package:redux/redux.dart';
import 'package:musicplayer/redux/index.dart';

final store = Store<AiPlayState>(reducer, initialState: AiPlayState.initState());

void main() {
  runApp(StoreProvider<StoreState>(
    store: createStore(),
    child: PlayStateProvider(
      child: App(),
    ),
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

