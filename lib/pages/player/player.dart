import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:musicplayer/util/global.dart';
import 'package:musicplayer/util/request.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/play_state.dart';
import 'package:musicplayer/util/system_util.dart';

import 'package:musicplayer/pages/player/header.dart';
import 'package:musicplayer/pages/player/player_inner.dart';
import 'package:musicplayer/pages/player/control_panel1.dart';
import 'package:musicplayer/pages/player/control_panel2.dart';
import 'package:musicplayer/pages/player/progress.dart';
import 'package:musicplayer/pages/player/play_list.dart';
import 'package:musicplayer/pages/home/home.dart';

//res只有设置为全局变量才可以在点击切歌的时候同步更改，这样在暂停时再次点击播放按钮时会继续当前歌曲的播放，而不会继续播放默认歌曲
var res='https://music.163.com/song/media/outer/url?id=33894312.mp3';
// var res=recommendList1[0]['id'];
final length=recommendList1.length;

class PlayerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    // final args=ModalRoute.of(context).settings.arguments as Map;
    final playState=PlayState.of(context);
    // final playing=useState(false);//是否播放状态
    // final player=getPlayer();//对player做实例

    setStatusBarStyle(Brightness.light);

    return Scaffold(
      body: Stack(
        children: [//唱片机背景模糊图
          Image.network(recommendList1[cnt]['img'], height: screen.height, width: screen.width, fit: BoxFit.fill,),//和屏幕一般高，但会被父级宽度限制，所以需要fit

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX:60, sigmaY:60),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),//背景图叠在下面

          Container(
            padding: EdgeInsets.only(top: screen.top, left: screen.calc(24), right: screen.calc(24)),

            child: Column(
              children: [
                Header(),
                PlayerInner(playing: playState.playing,),//大盘子

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: screen.width,
            child: Container(
              child: Column(
                children: [
                  ControlPanel1(
                    heart: false,
                    onDownload: (){
                      print('down');
                    },
                    onMessage: (){
                      Navigator.pushNamed(context, '/comment');
                    },
                  ),
                  Progress(
                    current: playState.current!=null?playState.current:null,
                    total: playState.total!=null?playState.total:null,),
                  ControlPanel2(
                    playing: playState.playing,
                    onPlayTap: ()async{
                      // var id=recommendList1[0]['id'];
                      // res=await getSgUrl(id);
                      // print(res);
                      //
                      playState.player.play(res);
                      // print('-----------------------cnt: $cnt');
                      // print('onPlayTap');
                      //播放时设为true，图标显示为pause
                    },
                    onPauseTap: ()async{
                      playState.player.pause();
                      //播放时设为false，图标显示为play
                    },
                    onBackward: ()async{
                      if(cnt>0) {
                        cnt--;
                        var id = recommendList1[cnt]['id'];
                        print('------id: $id');
                        getComment(id);
                        res = await getSgUrl(id);
                        print('--------------------------');
                        print('res: $res');
                        playState.player.play(res);
                        print('back');
                      }else{
                        cnt=length-1;
                        var id = recommendList1[cnt]['id'];
                        print('------id: $id');
                        getComment(id);
                        res = await getSgUrl(id);
                        print('--------------------------');
                        print('res: $res');
                        playState.player.play(res);
                      }
                    },
                    onForward: ()async{
                      print('cnt: $cnt');
                      if(cnt<length-1) {
                        cnt++;
                        print('----------cnt: $cnt');
                        var id=recommendList1[cnt]['id'];
                        getComment(id);
                        res = await getSgUrl(id);
                        playState.player.play(res);
                        print('forward');
                      }else{
                        cnt=0;//回撤至1而不是0，避免到onBackward时爆栈
                        var id=recommendList1[cnt]['id'];
                        getComment(id);
                        res = await getSgUrl(id);
                        playState.player.play(res);
                        print('forward');
                      }
                    },
                    onPlaylist: (){
                      showPlayList(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}


getSgUrl(String id) async {

  final response = await DioUtil.getInstance()
      .post("$API_PREFIX/song/url?id=$id&br=320000", {});
  final data = response.data;
  // print('**************************');
  // print('data: ${data.toString()}');
  // print('**************************');
  String url = data['data'][0]['url'];
  if(url==null){//防止无权限歌曲的出现，导致歌曲空挡
    // url='http://m801.music.126.net/20210403175852/e3f6214608219b5c517ace89919eb342/jdymusic/obj/w5zDlMODwrDDiGjCn8Ky/1668938014/7cda/6ba0/49ff/1f7a90a7869eba1ef4d454e2db6f5b87.mp3';
    url='http://music.163.com/song/media/outer/url?id=404465743.mp3';
  }
  url = 'https${url.split('http')[1]}';
  print('**************************');
  print('===============id: $id');
  print('data: ${url.toString()}');
  print('**************************');

  return url;

}



// playState.player.play(musicBase[cnt++]['url']);
List<Map<String, dynamic>> musicBase = <Map<String, dynamic>>[
  {
    'name': '无归',
    'artists': '叶里',
    'url': 'https://music.163.com/song/media/outer/url?id=404465743.mp3',
    "img1v1Url": "https://p1.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg",
    'like': false
  },
  {
    'name': '扉をあけて',
    'artists': 'ANZA',
    'url': 'https://music.163.com/song/media/outer/url?id=555959.mp3',
    "img1v1Url": "https://p1.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg",
    'like': false
  },
  {
    'name': 'Past The Stargazing Season',
    'artists': 'Mili',
    'url': 'https://music.163.com/song/media/outer/url?id=29401202.mp3',
    "img1v1Url": "https://p2.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg",
    'like': false
  },
  {
    'name': '扉をあけて',
    'artists': 'ANZA',
    'url': 'https://music.163.com/song/media/outer/url?id=1823305772.mp3',
    "img1v1Url": "https://p1.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg",
    'like': false
  },
  {
    'name': '扉をあけて',
    'artists': 'ANZA',
    'url': 'https://music.163.com/song/media/outer/url?id=1828102809.mp3',
    "img1v1Url": "https://p1.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg",
    'like': false
  },
  {
    'name': '扉をあけて',
    'artists': 'ANZA',
    'url': 'https://music.163.com/song/media/outer/url?id=1374083992.mp3',
    "img1v1Url": "https://p1.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg",
    'like': false
  },
  {
    'name': '扉をあけて',
    'artists': 'ANZA',
    'url': 'https://music.163.com/song/media/outer/url?id=1460319077.mp3',
    "img1v1Url": "https://p1.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg",
    'like': false
  },

];