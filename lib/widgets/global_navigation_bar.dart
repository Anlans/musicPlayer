import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';

// class GlobalNavigationBar extends HookWidget{
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.play_arrow),
//           title: Text('发现'),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.play_arrow),
//           title: Text('发现'),
//         ),
//       ],
//     );
//   }
// }

class GlobalNavigationBar extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    
    return Container(
      height: screen.calc(98),
      decoration: BoxDecoration(
        color: Color(0x66ffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//使用主轴让底部图标空间相同
        children: [
          NavigationBarItem(
            img: 'assets/icon-music-acc-b.png',
            active_img: 'assets/icon-music-acc.png',
            active: true,
          ),
          NavigationBarItem(
            img: 'assets/icon-video-b.png',
            active_img: 'assets/icon-video.png',
            active: false,
          ),
          NavigationBarItem(
            img: 'assets/icon-music-b.png',
            active_img: 'assets/icon-music.png',
            active: false,
          ),
          NavigationBarItem(
            img: 'assets/icon-group-b.png',
            active_img: 'assets/icon-group.png',
            active: false,
          ),
          NavigationBarItem(
            img: 'assets/icon-person-b.png',
            active_img: 'assets/icon-person.png',
            active: false,
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget{
  final String img;
  final String active_img;  //亮起来的底部图标
  final String title;
  final bool active;        //确认当前所在页面图标是否处于此页面(以便切换图标空心实心效果)

  NavigationBarItem({Key key,
    this.active_img,
    this.img,
    this.title,
    this.active=false
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      child: Column(
        children: [
          Container(
            width: screen.calc(56),
            height: screen.calc(56),
            decoration: BoxDecoration(
              gradient: active?LinearGradient(
                colors: [
                  Color(0xffff584a),
                  Color(0xffff1f14),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerLeft,
              ):null,//渐变
              // image: DecorationImage(
              //   image: AssetImage('assets/icon-music-acc.png'),
              //   scale: 0.5,
              // ),
              borderRadius: BorderRadius.circular(screen.calc(28)),
            ),
            child: Center(
              child:  Image.asset(active?active_img:img, width: screen.calc(30), height: screen.calc(30),),
            ),
          ),
          Text('data'),
        ],
      ),
    );
  }
}