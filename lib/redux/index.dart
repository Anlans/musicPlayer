import 'package:meta/meta.dart';

@immutable
class AiPlayState {
  Map _aiplayState;

  get aipalyState => _aiplayState;
  AiPlayState.initState() {
    _aiplayState = {
      'play': 'stop',
      'isNewPlay': false,
      'playingData': {
        'id': '',
        'commentId': '',
        'playList': [],
        'index': null,
        'percent': null,
        'imgUrl': '',
        'mp3Url': '',
        'name': '',
        'musicPlayer': null,
        'controller': null,
        'lrc': '',
        'ar': null,
      },
      'commentData': {
        'id': '',
        'imgUrl': '',
        'name': '',
        'ar': [],
      },
      'home': {
        'songlist': [],
      },
    };
  }
  AiPlayState(this._aiplayState);
}

AiPlayState reducer(AiPlayState state, action) {
  //匹配Action
  if (action['type'] == 'changePlay') {
    state.aipalyState['play'] = action['payload'];
    return AiPlayState(state.aipalyState);
  }
  if (action['type'] == 'setPlayingData') {
    state.aipalyState['playingData'].addEntries(action['payload'].entries);
    return AiPlayState(state.aipalyState);
  }
  if (action['type'] == 'setCommentData') {
    state.aipalyState['commentData'].addEntries(action['payload'].entries);
    return AiPlayState(state.aipalyState);
  }
  if (action['type'] == 'setHome') {
    state.aipalyState['home'].addEntries(action['payload'].entries);
    return AiPlayState(state.aipalyState);
  }
  return state;
}
