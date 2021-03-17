import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
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

    setStatusBarStyle(Brightness.light);

    return Scaffold(
      body: Stack(

        children: [
          Container(//总体加背景白色，避免渐变透明被下层Container覆盖
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            height: screen.calc(600),
            decoration: BoxDecoration(//广场页整体大背景使用渐变 自上而下 由 灰——>白
                gradient: LinearGradient(
                  colors: [Color(0xff959a99), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),

          Container(
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
        ],



      ),
      bottomNavigationBar: GlobalNavigationBar(
        value: 2,
      ),
    );
  }

}