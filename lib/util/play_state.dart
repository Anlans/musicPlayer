import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


AudioPlayer _audioPlayer;
//单例方法， 永远返回同一个实例

AudioPlayer getPlayer(){//每次调用getPlayer方法，检查是否已创建，为空则新建一个AudioPlayer对象
  if(_audioPlayer==null){
    _audioPlayer=AudioPlayer();
  }

  return _audioPlayer;
}

//全局共享player

//inheritedWidget   PlayState
//stateful + state  PlayStateProvider PlayStateProviderState

class PlayState extends InheritedWidget{
  //播放状态，当前播放时间
  final bool playing;
  final int current;
  final int total;
  final AudioPlayer player;


  PlayState({
    Key key,
    Widget child,
    this.playing,
    this.total,
    this.current,
    this.player,
  }):super(key: key, child: child);

  static PlayState of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<PlayState>();//自己去找PlayState类型
  }

  @override
  bool updateShouldNotify(PlayState oldWidget) {
    //true ->应该更新 ->不一样
    return
      oldWidget.playing!=playing ||
      oldWidget.current!=current ||
      oldWidget.total!=total;
  }
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}){
    return '''
playing: $playing
current: $current
total: $total''';
  }

}



class _PlayStateProviderState extends State{
  final Widget child;
  AudioPlayer player;
  bool playing=false;
  int current;
  int total;

  _PlayStateProviderState({this.child}):super(){//继承自State没有key
    player=getPlayer();


    player.onPlayerStateChanged.listen((event) {

      setState(() {//保持播放状态更新正常
        // print(event);
        playing=event==AudioPlayerState.PLAYING;
      });
    });//关心播放状态是否变化
    player.onAudioPositionChanged.listen((event) {
      setState(() {
        // print('current: ${event.inSeconds}');
        current=event.inSeconds;
      });
      // print(event);
    });//关注当前的时间

    player.onDurationChanged.listen((event) {
      setState(() {
        // print('total: ${event.inSeconds}');
        total=event.inSeconds;
      });
    });//时长变化，关于是否加载，切歌

  }

  @override
  Widget build(BuildContext context) {
    //装在App的外面
    return PlayState(
      playing: playing,
      current: current,
      total: total,
      player: player,

      child: child,
    );
  }
}

class PlayStateProvider extends StatefulWidget{
  final Widget child;

  PlayStateProvider({Key key, this.child}):super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayStateProviderState(child: child);
}
