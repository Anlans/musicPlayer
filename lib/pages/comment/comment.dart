import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/widgets/header.dart';
import 'package:musicplayer/widgets/playing.dart';
import 'package:musicplayer/pages/home/home.dart';




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
            child: Image.network(avatar),
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