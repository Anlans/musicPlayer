import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/widgets/header.dart';
import 'package:musicplayer/widgets/playing.dart';

const comments=[
  {
    'id': 322,
    'nickname': '吟游猫诗人',
    'avatar': 'assets/tmp_avatar_1.png',
    'date': '2015年07月02日',
    'likes': 6654,
    'content': '非常喜欢这种声音这种曲风，更别说颜值那么高的一位歌手，直男都能瞬间被瓣弯。。话说一听到他的歌声和风格我就想到另一位我喜欢好多年的歌手- james morrison.顺带推荐。',
    'comments': 65,
  },
  {
    'id': 3423,
    'nickname': 'aaaa',
    'avatar': 'assets/tmp_avatar_1.png',
    'date': '2050年09月30日',
    'likes': 665554,
    'content': '据中国国家航天局探月与航天工程中心消息，嫦娥四号着陆器和“玉兔二号”月球车分别于9月24日7时30分、9月23日23时18分结束第22月昼工作，按地面指令完成月夜模式设置，进入月夜休眠。科研人员利用全景相机环拍探测、红外成像光谱仪定标探测、测月雷达行驶过程中同步探测等数据，取得多项科学成果，近期发表在Nature Astronomy国际期刊上。图为测月雷达高频通道的探测剖面及解译结果。中新社发 中国国家航天局',
    'comments': 7764,
  },
  {
    'id': 1,
    'nickname': '澎湃新闻',
    'avatar': 'assets/tmp_avatar_1.png',
    'date': '2020年09月25日',
    'likes': 32,
    'content': '曾几何时，我们曾经专门讨论过一汽夏利的问题，当时的夏利虽然已经面临着四面楚歌的危局，但是还有着一丝希望，然而就在最近这最后的曙光也消散殆尽，夏利正式一元卖身，一个时代彻底终结了，当A股再无夏利的时候，我们该回过头来看看这个曾经的国民神车是怎么走到如今彻底曲终人散的境地的？',
    'comments': 3,
  },
  {
    'id': 22,
    'nickname': '吟游猫诗人',
    'avatar': 'assets/tmp_avatar_1.png',
    'date': '2015年07月02日',
    'likes': 6654,
    'content': '非常喜欢这种声音这种曲风，更别说颜值那么高的一位歌手，直男都能瞬间被瓣弯。。话说一听到他的歌声和风格我就想到另一位我喜欢好多年的歌手- james morrison.顺带推荐。',
    'comments': 65,
  },
  {
    'id': 33,
    'nickname': '吟游猫诗人',
    'avatar': 'assets/tmp_avatar_1.png',
    'date': '2015年07月02日',
    'likes': 6654,
    'content': '非常喜欢这种声音这种曲风，更别说颜值那么高的一位歌手，直男都能瞬间被瓣弯。。话说一听到他的歌声和风格我就想到另一位我喜欢好多年的歌手- james morrison.顺带推荐。',
    'comments': 65,
  },
];


class CommentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    setStatusBarStyle(Brightness.dark);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screen.top,
                left: screen.calc(32),
                right: screen.calc(32),
              ),
              child: Header(
                title: '评论(5126)',
                isHero: false,
                right: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: screen.calc(36)),
                      child: Icon(Icons.share),
                    ),
                    Playing(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screen.top,
                left: screen.calc(32),
                right: screen.calc(32),
              ),
              child: _Sorter(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screen.top,
                    left: screen.calc(32),
                    right: screen.calc(32),
                  ),
                  child: _List(items: comments),
                ),
              ),
            ),
            _Footer(),
          ],
        ),
      ),
    );
  }
}




const _sorterItems=[
  {'value': 1, 'title': '按推荐排序'},
  {'value': 2, 'title': '按时间排序'},
  {'value': 3, 'title': '按点赞排序'},
];
class _Sorter extends HookWidget{//排序器
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final selected=useState(_sorterItems[0]['value']);

    return Row(
      children: [
        Text(_sorterItems.firstWhere((element) => element['value']==selected.value)['title']),
        Spacer(),
        DropdownButton(
            value: selected.value,
            onChanged: (val){
              selected.value=val;
            },
            items: _sorterItems.map((item)=>DropdownMenuItem(
                value: item['value'],
                child: Text(item['title'])),
            ).toList()
        ),
      ],
    );
  }
}

class _List extends StatelessWidget{
  final List<Map> items;

  _List({Key key, this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Column(
      children: items.asMap().map((index,item)=>MapEntry(
          index,
          _ListItem(
            avatar: item['avatar'],
            nickname: item['nickname'],
            date: item['date'],
            likes: item['likes'],
            content: item['content'],
            comments: item['comments'],

            hasBorder: index!=items.length-1,
          )
      )).values.toList(),
    );
  }
}
class _ListItem extends StatelessWidget{
  final String nickname;
  final String avatar;


  final String date;
  final int likes;
  final String content;
  final int comments;

  final bool hasBorder;

  _ListItem({
    Key key,
    this.hasBorder=true,
    this.nickname,
    this.avatar,

    this.date,
    this.likes,
    this.content,
    this.comments,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      padding: EdgeInsets.only(top: screen.calc(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screen.calc(70),
            height: screen.calc(70),
            child: Image.asset(avatar),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: hasBorder?Border(bottom: BorderSide(
                  color: Color(0xffe6e6e6),
                  width: 1,
                )):null,
              ),
              padding: EdgeInsets.only(left: screen.calc(20), bottom: screen.calc(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: screen.calc(4)),
                              child: Text(nickname, style: TextStyle(
                                color: Color(0xff666666),
                                fontSize: screen.calc(26),
                              )),
                            ),
                            Text(date, style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: screen.calc(18)
                            )),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            print('like');
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: screen.calc(14), right: screen.calc(8)),
                                child: Text(likes.toString(), style: TextStyle(
                                  color: Color(0xff999999),
                                )),
                              ),
                              Icon(Icons.thumb_up, color: Color(0xff999999)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: screen.calc(16)),
                      child: Text(content, style: TextStyle(

                      ), strutStyle: StrutStyle(
                          fontSize: screen.calc(50)
                      ))
                  ),
                  comments>0?Text('$comments条回复>', style: TextStyle(
                    fontSize: screen.calc(24),
                    color: Color(0xff507daf),
                  )):Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      height: screen.calc(97),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(
            color: Color(0xffcbcbcb),
            width: 1,
          ))
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
                hintText: '听了这么多，可能你有话想说',
                hintStyle: TextStyle(
                  fontSize: screen.calc(28),
                  color: Color(0xffc0c0c0),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: screen.calc(26)),
            child: Image.asset('assets/icon-tie.png'),
          ),
          Container(
            margin: EdgeInsets.only(right: screen.calc(20)),
            child: Image.asset('assets/icon-comment-emoji.png'),
          ),

        ],
      ),
    );
  }
}