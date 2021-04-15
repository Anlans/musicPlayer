import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
import 'package:musicplayer/util/system_util.dart';
import 'package:musicplayer/widgets/header.dart';
import 'package:musicplayer/widgets/playing.dart';


class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    setStatusBarStyle(Brightness.dark);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: screen.top,
          left: screen.calc(32),
          right: screen.calc(32),
        ),
        child: Column(
          children: [
            Header(
              title: '评论(5126)',
              isHero: false,
              right: Row(
                mainAxisAlignment: MainAxisAlignment.end,//靠右边
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: screen.calc(36)),
                    child: Icon(Icons.share,),
                  ),
                  Playing(),
                ],
              ),
            ),
            _Sorter(),
            Expanded(
              child: SingleChildScrollView(
                child: _List(),
              ),
            ),
            _Footer(),
          ],
        ),
      ),
    );
  }

}

class _Sorter extends StatelessWidget{//排序器
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Row(
      children: [

      ],
    );
  }
}


class _List extends StatelessWidget{//排序器
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Column(
      children: [
        _ListItem(),
        _ListItem(),
        _ListItem(),
        _ListItem(),
        _ListItem(),
        _ListItem(),
        _ListItem(),
        _ListItem(),
        _ListItem(),
      ],
    );
  }
}

class _ListItem extends StatelessWidget{//排序器
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Text('aaa');
  }
}
class _Footer extends StatelessWidget{//排序器
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Text('footer');
  }
}
