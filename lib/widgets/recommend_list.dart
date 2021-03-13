import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';


typedef PlayCallBack=void Function(String);
class RecommendList extends StatelessWidget{
  final String title;
  final VoidCallback onMore;        //GestureDetector的onTap点击参数
  final List<Map> items;            //歌曲资源参数
  final PlayCallBack onPlay;        //用户点击play所做事件

  RecommendList({Key key, this.title, this.onMore, this.items, this.onPlay}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(70)),
      child: Column(
        children: [

          _Header(title: title, onMore: onMore),  //播放全部 头部

          _Body(title: title, onMore: onMore,items: items, onPlay: onPlay),   //播放头部所在下方的歌单排布

        ],
      ),
    );
  }
}



class _Header extends StatelessWidget{
  final String title;
  final VoidCallback onMore;

  _Header({Key key, this.title, this.onMore}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Container(
      padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
      height: screen.calc(52),
      child: Row(
        children: [
          Center(
            child: Text(title, style: TextStyle(
              fontSize: screen.calc(34),
              fontWeight: FontWeight.w700,
            ),),
          ),
          Spacer(),
          GestureDetector(
            onTap: onMore,
            child: Container(
              padding: EdgeInsets.only(left: screen.calc(24), right: screen.calc(24)),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffe7e7e7), width: screen.calc(2)),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  Text('播放全部'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class _Body extends StatelessWidget{
  final List<Map> items;
  final String title;
  final VoidCallback onMore;
  final PlayCallBack onPlay;

  _Body({Key key, this.title, this.onMore, this.items, this.onPlay}):super(key:key);

  @override
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
            children: columns.map<Widget>((arr)=>Column(
              children: arr.map<Widget>((data)=>_Item(data: data)).toList(),    //md, 逻辑完美
            )).toList(),
          ),
        ),
      );
  }
}

//播放全部所在下方歌单 单个组件
class _Item extends StatelessWidget{
  final Map data;                 //歌曲信息数据map
  final PlayCallBack onPlay;
  _Item({Key key, this.data, this.onPlay}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      width: screen.calc(641),
      height: screen.calc(120),
      
      padding: EdgeInsets.only(top: screen.calc(20),),
      margin: EdgeInsets.only(right: screen.calc(45)),
      child: Row(
        children: [
          Container(
            width: screen.calc(120),
            height: screen.calc(120),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(data['img']),       //注意data的传参
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: screen.calc(20), top: screen.calc(16)),
              alignment: Alignment.centerLeft,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,//文字上下两行居左
                children: [
                  Text.rich(
                   TextSpan(children: [
                     TextSpan(text: '${data['title']}'),//传入歌名
                     TextSpan(text: ' - ${data['artist']}', style: TextStyle(//传入歌手
                       color: Color(0xff9a9a9a),
                     )),
                   ])
                  ),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: screen.calc(4), right: screen.calc(4)),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffff3a3a), width: 1),
                          borderRadius: BorderRadius.circular(screen.calc(4)),
                        ),
                        child: Text('SQ', style: TextStyle(color: Color(0xffff3a3a), fontSize: screen.calc(20)),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: screen.calc(8)),
                        child: Text(data['tip'], style: TextStyle(color: Color(0xff9a9a9a)),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              onPlay(data['id']);
            },
            child: Container(
              child: Center(
                child: Container(
                  height: screen.calc(50),
                  width: screen.calc(50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffe6e6e6), width: screen.calc(2)),
                    borderRadius: BorderRadius.circular(screen.calc(25)),
                  ),
                  child: Icon(Icons.play_arrow, size: screen.calc(30), color: Color(0xffff3a3a),),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}