# musicplayer

A new Flutter project for college.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### dayOne 开屏页的设计(等待后台加载)
Navigator.pushReplacementNamed(context, '/home');
screen.padding.top
screen.size.width  逻辑像素

/widgets 作为通用的组件文件夹(可重用)
/home 首页文件夹
header.dart置顶手机状态栏
banner.dart滚动条
category目录

banner.dart
轮播图
用到了carousel_slider(很有趣的小公举)

----------------------------------------------

/widgets
song_list.dart 歌单
voidCallback

##### recommend_list.dart 推荐列表歌单
1.使用二维List对columns添加歌单信息,每个Column固定为3个可重用播放组件,按照歌曲数目确定一共多少列,步数为3
```
  Widget build(BuildContext context) {
    final screen=Screen(context);

    final columns=[];

    for(var i=0;i<items.length;i+=3){       //每个Column固定为3个可重用播放组件,按照歌曲数目确定一共多少列,步数为3
      columns.add(items.sublist(i, i+3));
    }
    // print('items: ${items.length}');
    // print('columns: $columns');           //2x3列表

    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(top: screen.calc(4), left: screen.calc(32)),
          child: Row(
            children: columns.map<Widget>((arr)=>Column(                        //此处的map需加上Widget类型,规范编码
              children: arr.map<Widget>((data)=>_Item(data: data)).toList(),    //md, 逻辑完美
            )).toList(),
          ),
        ),
      );
  }
```


##### global_navigation_bar.dart 底部导航栏
1.这里也用到了VoidCallback类型的参数,因为不需要传递什么值,本设计普遍在用到GestureDetector的onTap时作为参数使用
 
2.使用循环方式,map取得index对下方功能键图标进行相应匹配,其中MapEntry的API注释如下

'/** Creates an entry with [key] and [value]. */'

```dart
    return Container(
      padding: EdgeInsets.only(top: screen.calc(9)),
      height: screen.calc(98),
      decoration: BoxDecoration(
        color: Color(0x66ffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//使用主轴让底部图标空间相同
        //循环生成导航栏下方功能键
        children: navigationItems.asMap().map((index,item)=>MapEntry(index, NavigationBarItem(
          img: item['img'],
          activeImg: item['activeImg'],
          title: item['title'],
          active: value==index,
        ))).values.toList(),
      ),
    );
```

2.对于Hero组件的应用,可以解决不同Container直接切换页面时,离开Scaffold脚手架会短暂的字体脱离,导致回到原生状态,此种情况的解决方法,
TextStyle(inherit: false), 必须要使用inherit属性false,即父级啥样你啥样别乱动
 - Hero组件,用于各个页面的穿越(果然Hero就是不一样,haha)
```dart
    return Hero(
      tag: '_bottom_nav_bar_1',
      child: DefaultTextStyle(
        style: TextStyle(inherit: false),
        child: Container(
          padding: EdgeInsets.only(top: screen.calc(9)),
          height: screen.calc(98),
          decoration: BoxDecoration(
            color: Color(0x66ffffff),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,//使用主轴让底部图标空间相同
            //循环生成导航栏下方功能键
            children: navigationItems.asMap().map((index,item)=>MapEntry(index, NavigationBarItem(
              img: item['img'],
              activeImg: item['activeImg'],
              title: item['title'],
              active: value==index,
              onTap: (){
                switch(index){
                  case 0:
                    Navigator.pushNamed(context, '/home');
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/square');
                    break;
                }
                // onChanged(index);//等待父级传参(home传参)
              },
            ))).values.toList(),
          ),
        ),
      )
    );
```
 










































































































































