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
import 'package:musicplayer/pages/home/home.dart';

const categoryItems=[
  {'id': 0, 'title': '推荐', 'color': null},
  {'id': 1, 'title': '官方', 'color': null},
  {'id': 2, 'title': '精品', 'color': 0xffe7aa5a},
  {'id': 3, 'title': '欧美', 'color': null},
  {'id': 4, 'title': '电子', 'color': null},
  {'id': 5, 'title': '流行', 'color': null},
  {'id': 6, 'title': '乡村', 'color': null},
  {'id': 7, 'title': '其他', 'color': null},
  {'id': 8, 'title': 'a', 'color': null},
  {'id': 9, 'title': 'b', 'color': null},
  {'id': 10, 'title': 'c', 'color': null},
  {'id': 11, 'title': 'd', 'color': null},
];

class SquarePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context).settings.arguments as Map;//可以从context里面拿东西
    final screen=Screen(context);
    final categoryID=useState(categoryItems[0]['id']);

    setStatusBarStyle(Brightness.light);

    // print(args);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                    Category(items: categoryItems, value: categoryID.value, onChanged: (id){
                      categoryID.value=id;
                    },),
                    BannerSlider(),
                    SquareList(items: listItems,),
                  ]
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GlobalNavigationBar(
        value: 2,
      ),
    );
  }

}