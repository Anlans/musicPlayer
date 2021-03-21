import 'package:audioplayers/audioplayers.dart';

AudioPlayer _audioPlayer;
//单例方法， 永远返回同一个实例

AudioPlayer getPlayer(){//每次调用getPlayer方法，检查是否已创建，为空则新建一个AudioPlayer对象
  if(_audioPlayer==null){
    _audioPlayer=AudioPlayer();
  }

  return _audioPlayer;
}

