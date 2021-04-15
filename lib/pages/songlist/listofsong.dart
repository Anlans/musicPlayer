import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:musicplayer/util/global.dart';
import 'package:musicplayer/util/request.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/pages/home/header.dart';
import 'package:musicplayer/pages/home/banner.dart';
import 'package:musicplayer/pages/home/category.dart';
import 'package:musicplayer/pages/square/square.dart';
import 'package:musicplayer/widgets/song_list.dart';
import 'package:musicplayer/widgets/recommend_list.dart';
import 'package:musicplayer/widgets/global_navigation_bar.dart';
import 'package:musicplayer/pages/player/play_list.dart';
import 'package:musicplayer/store.dart';

class SonglistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    setStatusBarStyle(Brightness.dark);

    return Scaffold(
      body: Text('aaaa'),
    );
  }

}