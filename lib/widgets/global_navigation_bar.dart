import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
//首页底部导航栏
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





const navigationItems=[//底部导航栏按钮信息
  {
    'img': 'assets/icon-music-acc-b.png',
    'activeImg': 'assets/icon-music-acc.png',
    'title': '发现',
  },
  {
    'img': 'assets/icon-person-b.png',
    'activeImg': 'assets/icon-person.png',
    'title': '账号',
  },
  {
    'img': 'assets/icon-music-b.png',
    'activeImg': 'assets/icon-music.png',
    'title': '我的',
  },
  // {
  //   'img': 'assets/icon-video-b.png',
  //   'activeImg': 'assets/icon-video.png',
  //   'title': '视频',
  // },

  // {
  //   'img': 'assets/icon-group-b.png',
  //   'activeImg': 'assets/icon-group.png',
  //   'title': '云村',
  // },


];

typedef NavigationBarCallback=void Function(int);

class GlobalNavigationBar extends HookWidget{
  final int value;
  // final NavigationBarCallback onChanged;//active状态

  GlobalNavigationBar({Key key, this.value=2}):super(key: key);//默认第一个发现亮

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    
    return Hero(
      tag: '_bottom_nav_bar_1',
      child: DefaultTextStyle(
        style: TextStyle(inherit: false),
        child: Container(
          padding: EdgeInsets.only(top: screen.calc(9)),
          height: screen.calc(98),
          decoration: BoxDecoration(
            color: Color(0x66ffffff),                         //底部栏的透明度颜色
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,  //使用主轴让底部图标空间相同
            //循环生成导航栏下方功能键
            children: navigationItems.asMap().map((index,item)=>MapEntry(index, NavigationBarItem(
              img: item['img'],
              activeImg: item['activeImg'],
              title: item['title'],
              active: value==index,
              onTap: (){
                switch(index){
                  case 0://发现
                    Navigator.pushNamed(context, '/home');
                    print('case0: index=$index');
                    break;
                  case 1: //账号
                    Navigator.pushNamed(context, '/user-center');
                    print('case2: index=$index');
                    break;
                  case 2://我的
                    Navigator.pushNamed(context, '/square');
                    print('case1: index=$index');
                    break;
                }
                // onChanged(index);//等待父级传参(home传参)
              },
            ))).values.toList(),
          ),
        ),
      )
    );
  }
}


//单个导航栏按钮的设计
class NavigationBarItem extends StatelessWidget{
  final String img;
  final String activeImg;     //亮起来的底部图标
  final String title;
  final bool active;          //确认当前所在页面图标是否处于此页面(以便切换图标空心实心效果)
  final VoidCallback onTap;   //点击

  NavigationBarItem({Key key,
    this.activeImg,
    this.img,
    this.title,
    this.active=false,
    this.onTap,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return GestureDetector(                     //使用GestureDetector来定义点击（无敌方便）
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              //按钮状态背景红色范围
              width: screen.calc(56),
              height: screen.calc(56),
              decoration: BoxDecoration(
                gradient: active?LinearGradient(//渐变颜色函数
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
              child: Center(                    //确认当前状态并展示是否被点击所对应的图片空心（true）or实心（false）
                child:  Image.asset(active?activeImg:img, width: screen.calc(30), height: screen.calc(30),),
              ),
            ),
            Text(title, style: TextStyle(
              fontSize: screen.calc(22),
              color: active?Color(0xffff1f14):Color(0xff969696),
            ),),
          ],
        ),
      ),
    );
  }
}