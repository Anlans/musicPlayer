import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:musicplayer/pages/player/player.dart';
import 'package:musicplayer/util/global.dart';
import 'package:musicplayer/util/request.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/pages/home/header.dart';
import 'package:musicplayer/pages/home/banner.dart';
import 'package:musicplayer/pages/home/category.dart';
import 'package:musicplayer/pages/square/square.dart';
import 'package:musicplayer/widgets/song_list.dart';
import 'package:musicplayer/widgets/recommend_list.dart';
import 'package:musicplayer/widgets/global_navigation_bar.dart';
import 'package:musicplayer/pages/player/play_list.dart';
import 'package:musicplayer/store.dart';
import 'package:musicplayer/util/play_state.dart';

bool tf=true;
int cnt=0;//掌握每首歌的状态，是否切歌，当前歌曲的图片及其歌名，作者
var aaa;

var songList1=[       //歌单信息
  {'id': '5315249487', 'img': 'http://p4.music.126.net/8sdYwsOfLA_3ciiuVHo0rQ==/109951165498690725.jpg', 'count': '9亿', 'title': '住在梦里的人，以后也要住进心里'},
  {'id': '2819914042', 'img': 'http://p4.music.126.net/nF_DRM-v5pEo-4n1brpM5w==/109951165845493667.jpg', 'count': '34.9亿', 'title': '[一周日语上新] 催眠麦克风最新对决曲 动感活力的视听盛宴'},
  {'id': '6677014498', 'img': 'http://p3.music.126.net/Qf3JhZed8Kb6h4L6Lw5yFg==/109951165830962378.jpg', 'count': '3232', 'title': '弱者才会一蹶不振，我要逆风翻盘！'},
  {'id': '5137936188', 'img': 'http://p3.music.126.net/FNUk4SzH0iVCC3J571vSDw==/109951165338007405.jpg', 'count': '19万', 'title': '治愈轻音 | 让心中无事，如清水长流'},
  {'id': '6656095670', 'img': 'http://p3.music.126.net/1YDNWkIy_9GiIy7Kc_TsNw==/109951165796917206.jpg', 'count': '3232', 'title': '攒满想念值，换一次见面好不好'},
  {'id': '5377296264', 'img': 'http://p4.music.126.net/xV4sUkFfgiLU85MhD2aROw==/109951165597483922.jpg', 'count': '20亿亿', 'title': 'Lofi/复古/一场听觉盛宴'},
];

var recommendList1=[  //推荐列表歌曲信息
  {'id':'1827600686', 'img': 'http://p3.music.126.net/K99_XfgglMlcTqJvkSE7aA==/18763165929885302.jpg', 'title': '还是会想你', 'artist': '林达浪', 'tip':'还是会想你'},
  {'id':'1377053293', 'img': 'http://p3.music.126.net/pBI3QDlNCURn_dShKKzOmQ==/109951164204208497.jpg', 'title': '山海皆可平', 'artist': 'CMJ', 'tip':'山海皆可平'},
  {'id':'1384026889', 'img': 'http://p4.music.126.net/M34HFzLO2xhDLuX_zEALKA==/109951164291347934.jpg', 'title': '所念皆星河', 'artist': 'CMJ', 'tip':'告白実行委員会'},

  {'id':'1832573261', 'img': 'http://p4.music.126.net/mgbTU1J-ilSmeO6I-NHi7g==/109951165834914177.jpg', 'title': 'Dance With Me', 'artist': "SHE'S", 'tip':'Groovin'},
  {'id':'1824415848', 'img': 'http://p4.music.126.net/W9rGvRP3j-qICdS4OuE38w==/109951165774446145.jpg', 'title': 'Phenomena', 'artist': 'Shingo Nakamura', 'tip':'Phenomena'},
  {'id':'1833379103', 'img': 'http://p3.music.126.net/fjtfUFKKXhHFQcsNcga7Lw==/109951165845178824.jpg', 'title': 'Pick N Choose', 'artist': 'JP THE WAVY', 'tip':'WAVY TAPE 2'},

];

var listItems=[//待更换
  {'id':11, 'img':'assets/tmp_cover_1.jpg', 'title': '钢琴摇滚 | 浪子赠予诗人的一纸情书'},
  {'id':12, 'img':'assets/tmp_cover_2.jpg', 'title': '夏天悄悄过去'},
  {'id':13, 'img':'assets/tmp_cover_3.jpg', 'title': '夏天悄悄过去'},

  {'id':14, 'img':'assets/tmp_cover_4.jpg', 'title': '夏天悄悄过去'},
  {'id':15, 'img':'assets/tmp_cover_5.jpg', 'title': '夏天悄悄过去'},
  {'id':16, 'img':'assets/tmp_cover_6.jpg', 'title': '夏天悄悄过去'},

  {'id':17, 'img':'assets/tmp_cover_6.jpg', 'title': '夏天悄悄过去'},
  {'id':18, 'img':'assets/tmp_cover_6.jpg', 'title': '夏天悄悄过去'},
  {'id':19, 'img':'assets/tmp_cover_6.jpg', 'title': '夏天悄悄过去'},

  {'id':20, 'img':'assets/tmp_cover_6.jpg', 'title': '夏天悄悄过去'},
  {'id':21, 'img':'assets/tmp_cover_6.jpg', 'title': '夏天悄悄过去'},
  {'id':22, 'img':'assets/tmp_cover_6.jpg', 'title': '夏天悄悄过去'},
];

var comments=[
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


class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final nickname=useSelector<StoreState, String>((state)=>state.nickname);
    final playState=PlayState.of(context);
    var res;

    setStatusBarStyle(Brightness.dark);

    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(
          color: Color(0xff333333),
        ),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.only(top: screen.top+screen.calc(7)),
            child: Column(
              children: [
                // Text(nickname!=null?nickname:'<未登录>'),
                MyHeader(),
                MyBanner(),
                Category(),

                SongList(title: '你的歌单精选站', onMore: (){
                  Navigator.pushNamed(context, '/square');
                }, items: songList1,),

                RecommendList(title: '根据 Red 推荐', items: recommendList1, onMore: (){
                  print('more');
                }, onPlay: (id, img, title, artist) async {
                  print('play');
                  res = await getSgUrl(id);
                  getComment(id);
                  recommendList1[0]['img']=img;
                  recommendList1[0]['title']=title;
                  recommendList1[0]['artist']=artist;
                  playState.player.play(res);
                },),
                Container(
                  height: screen.calc(100),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GlobalNavigationBar(     //底部导航栏
        value: 0,                                   //开启后默认所在页
      ),
    );
  }

}

void getSongListDetail(int index)async{//拿到歌单每首歌的数据,重置recommendList1
  //index表示点击指定歌单时，内部播放的歌曲为不同风格的歌单所包含
  int loc=0;
  getSongList();
  print('00000000000歌单id为${songList1[index]['id']}');
  final response =
    await DioUtil.getInstance().post("$API_PREFIX/playlist/detail?id=${songList1[index]['id']}", {});
  final data=response.data;

  for(int i=0; i<6; i++) {
    // if(loc>5) loc=0;
    // loc++;//不可直接在数组中使用++，否则会 歌曲id对应其作者artist等数据不匹配
    List trackLen=data['playlist']['tracks'];
    // if(trackLen.isEmpty) print('此时歌单id为$')
    int sgListDetailSongId = data['playlist']['tracks'][i]['id'];
    String sgLDSId = sgListDetailSongId.toString();
    String sgListDetailSongName = data['playlist']['tracks'][i]['name'];
    String sgListDetailSongArtist = data['playlist']['tracks'][i]['ar'][0]['name'];
    String sgListDetailSongImg = data['playlist']['tracks'][i]['al']['picUrl'];
    String sgListDetailSongTip=data['playlist']['tracks'][i]['al']['name'];

    recommendList1[i]['id']=sgLDSId;
    recommendList1[i]['img']=sgListDetailSongImg;
    recommendList1[i]['title']=sgListDetailSongName;
    recommendList1[i]['artist']=sgListDetailSongArtist;
    recommendList1[i]['tip']=sgListDetailSongTip;
    // print('=============loc: $loc');

  }
}

void getComment(var id)async{
  final response = await DioUtil.getInstance()
      .post("$API_PREFIX/comment/music?id=$id&limit=20", {});
  final data = response.data;
  var loc=0;
  for(var i=0; i<6; i++){
    // if(loc>10) loc=0;
    String avatarUrl=data['hotComments'][i]['user']['avatarUrl'];
    String nickName=data['hotComments'][i]['user']['nickname'];
    String content=data['hotComments'][i]['content'];
    var likeCount=data['hotComments'][i]['likedCount'];
    comments[i]['avatar']=avatarUrl;
    comments[i]['nickname']=nickName;
    comments[i]['content']=content;
    comments[i]['likes']=likeCount;
    // loc++;
    // print('--loc: $loc-------content: $content-----------');
  }


}

// void getSongSuccess(String id, bool tf)async{//未用
//   final response = await DioUtil.getInstance()
//       .post("$API_PREFIX/song/url?id=$id&br=320000", {});
//   final data = response.data;
//   String url = data['data'][0]['url'];
//   if(url == null){
//
//   }
// }

void getSongList()async{
  var loc=0;
  final response =
    await DioUtil.getInstance().post("$API_PREFIX/top/playlist?limit=100&order=hot", {});
  final data=response.data;

  for(var i=0; i<6; i++) {
    if(i==2) continue;//该歌单内容为空，跳过
      int sgListId = data['playlists'][i]['id'];
      String sgListId1 = sgListId.toString();
      String sgListImg = data['playlists'][i]['coverImgUrl'];
      String sgListName = data['playlists'][i]['name'];

      songList1[i]['img']=sgListImg;
      songList1[i]['id']=sgListId1;
      songList1[i]['title']=sgListName;

      loc++;
  }
}

void getSongListSquare()async{
  var loc=20;
  final response =
    await DioUtil.getInstance().post("$API_PREFIX/top/playlist?limit=100&order=hot", {});
  final data=response.data;

  for(var i=0; i<12; i++) {
    if(loc<50) {
      int sgListId = data['playlists'][loc]['id'];
      String sgListImg = data['playlists'][loc]['coverImgUrl'];
      String sgListName = data['playlists'][loc]['name'];

      listItems[i]['img']=sgListImg;
      listItems[i]['id']=sgListId;
      listItems[i]['title']=sgListName;

      loc++;
    }else{
      loc=1;
    }
  }
}

void updateSongDetail(){//用于搜索结果点击歌曲对播放页面进行歌曲信息更改

}

void getSongDetail()async{
  getSongList();
  getSongListDetail(3);


  // final response =
  //   await DioUtil.getInstance().post("$API_PREFIX/song/detail?ids=${recommendList1[0]['id']}", {});
  //
  // final data = response.data;
  // String imgUrl=data['songs'][0]['al']['picUrl'];
  // print('--------------imgUrl: $imgUrl');

  // recommendList1[1]['img']=imgUrl;
  // {'id': '5315249487', 'img': 'http://p4.music.126.net/8sdYwsOfLA_3ciiuVHo0rQ==/109951165498690725.jpg', 'count': '9亿', 'title': '住在梦里的人，以后也要住进心里'},
  // {'id': '2819914042', 'img': 'http://p4.music.126.net/nF_DRM-v5pEo-4n1brpM5w==/109951165845493667.jpg', 'count': '34.9亿', 'title': '[一周日语上新] 催眠麦克风最新对决曲 动感活力的视听盛宴'},
  // {'id': '6677014498', 'img': 'http://p3.music.126.net/Qf3JhZed8Kb6h4L6Lw5yFg==/109951165830962378.jpg', 'count': '5335', 'title': '弱者才会一蹶不振，我要逆风翻盘！'},
  // {'id': '5137936188', 'img': 'http://p3.music.126.net/FNUk4SzH0iVCC3J571vSDw==/109951165338007405.jpg', 'count': '19万', 'title': '治愈轻音 | 让心中无事，如清水长流'},
  // {'id': '6656095670', 'img': 'http://p3.music.126.net/1YDNWkIy_9GiIy7Kc_TsNw==/109951165796917206.jpg', 'count': '3232', 'title': '攒满想念值，换一次见面好不好'},
  // {'id': '5377296264', 'img': 'http://p4.music.126.net/xV4sUkFfgiLU85MhD2aROw==/109951165597483922.jpg', 'count': '20亿亿', 'title': 'Lofi/复古/一场听觉盛宴'},
}