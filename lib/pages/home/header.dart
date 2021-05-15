import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/global.dart';
import 'package:musicplayer/util/request.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/widgets/playing.dart';
import 'package:musicplayer/pages/home/home.dart';

var searchList=[  //推荐列表歌曲信息
  {'id':'1304953534', 'img': 'https://p2.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg', 'name': '山河令', 'artist': '茶理理'},
  {'id':'1304953534', 'img': 'https://p2.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg', 'name': '山河令', 'artist': '茶理理'},
  {'id':'1304953534', 'img': 'https://p2.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg', 'name': '山河令', 'artist': '茶理理'},

  {'id':'1304953534', 'img': 'https://p2.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg', 'name': '山河令', 'artist': '茶理理'},
  {'id':'1304953534', 'img': 'https://p2.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg', 'name': '山河令', 'artist': '茶理理'},
  {'id':'1304953534', 'img': 'https://p2.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg', 'name': '山河令', 'artist': '茶理理'},
];

class MyHeader extends HookWidget{
  @override
  Widget build(BuildContext context) {
    var screen=Screen(context);

    final controller=useState(TextEditingController());//利用其可以跨越build来存储数据（HookWidget自身buff）
    // controller.value.addListener(() {//controller在build的时候会被重建
    //   // print(controller.value.value.text);//拿到输入的值
    //   // getSearchList(controller.value.value.text.toString());
    // });
    // getSearchList(controller.value.value.text.toString());

    return Container(
      padding: EdgeInsets.only(left: screen.calc(24), right: screen.calc(24)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: screen.calc(16)),
            child: Image.asset('assets/header_icon_music.png', width: screen.calc(72), height: screen.calc(72),),
          ),

          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: screen.calc(30), right: screen.calc(30)),
                  height: screen.calc(72),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screen.calc(36)),
                    color: Color(0xfff7f7f7),
                  ),
                  child: TextField(
                    controller: controller.value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: ()async{
                      print('controller: ${controller.value.value.text}');
                      await getSearchList(controller.value.value.text.toString());
                      // controller.value=null;
                      Timer(Duration(seconds: 2), () {
                        print("2秒后执行");
                        Navigator.pushNamed(context, '/searchlist');
                      });

                    },
                    child: Container(
                      width: screen.calc(522),
                      height: screen.calc(72),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search, color: Color(0xff949495),),
                            Text('OneDay', style: TextStyle(color: Color(0xffc5c5c5)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: screen.calc(32)),
            child: Playing(),
          ),
        ],
      )
    );
  }

}

getSearchList(var keywords)async{
  final response =
    await DioUtil.getInstance().post("$API_PREFIX/search?keywords=$keywords", {});
  final data=response.data;
  for(var i=0; i<6; i++){
    var id1=data['result']['songs'][i]['id'];
    var id=id1.toString();
    String songName=data['result']['songs'][i]['name'];
    String artist=data['result']['songs'][i]['artists'][0]['name'];
    print('-----artist: $artist----');
    searchList[i]['id']=id;
    searchList[i]['name']=songName;
    searchList[i]['artist']=artist;
  }
}