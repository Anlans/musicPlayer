import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';

class Progress extends StatelessWidget{
  final int current;
  final int total;

  Progress({Key key, this.current, this.total}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final W=558.0;//播放条总宽度
    // final args=ModalRoute.of(context).settings.arguments as Map;
    // print(args);

    final curTime=
        current==null?
        '--:--':
        '${(current~/60).toString().padLeft(2, '0')}:${(current%60).toString().padLeft(2, '0')}';

    final totalTime=
        total==null?
        '--:--':
        '${(total~/60).toString().padLeft(2, '0')}:${(total%60).toString().padLeft(2, '0')}';

    double curWidth=//给一个double
      (current==null||total==null||total==0)?
      0:
      screen.calc((W-40)*current/total);//白条宽度


    return Container(
      margin: EdgeInsets.only(top: screen.calc(50)),
      height: screen.calc(30),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white.withOpacity(.6),
          fontSize: screen.calc(25),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: screen.calc(28), ),
              child: Text(curTime),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: screen.calc(18), right: screen.calc(18)),//进度条左右空隙
                height: screen.calc(30),
                child: Stack(
                  children: [
                    Center(
                      child: Container(//进度条
                        width: screen.calc(W),
                        margin: EdgeInsets.only(left: screen.calc(9), right: screen.calc(9)),
                        height: screen.calc(4),
                        color: Colors.white.withOpacity(.6),
                        child: Stack(
                          children: [
                            Container(
                              width: curWidth,
                              color: Colors.white.withOpacity(.4),//叠加之后颜色更深
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(//需要定位
                      top: screen.calc(6),
                      left: curWidth,
                      child: Container(//小圆点
                        width: screen.calc(16),
                        height: screen.calc(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screen.calc(16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: screen.calc(28)),
              child: Text(totalTime),
            ),
          ],
        ),
      ),
    );
  }

}