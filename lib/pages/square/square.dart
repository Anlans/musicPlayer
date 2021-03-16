import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/global_navigation_bar.dart';
import 'package:musicplayer/pages/square/header.dart';
import 'package:musicplayer/pages/square/category.dart';
import 'package:musicplayer/pages/square/square_list.dart';
import 'package:musicplayer/pages/square/banner_slider.dart';

class SquarePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context).settings.arguments as Map;//可以从context里面拿东西
    final screen=Screen(context);
    final categoryID=useState(items[0]['id']);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.top+screen.calc(7)),
        child: Column(
          children:[
            Header(),
            Category(items: items, value: categoryID.value, onChanged: (id){
              categoryID.value=id;
            },),
            BannerSlider(),
            SquareList(),
          ]
        ),
      ),
      bottomNavigationBar: GlobalNavigationBar(
        value: 2,
      ),
    );
  }

}