import 'package:flutter/material.dart';
import 'package:musicplayer/util/screen_util.dart';
//播放列表遮罩
void showPlayList(BuildContext context){
  final screen=Screen(context);
  final borderColor=Color(0xffe6e6e6);

  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(.3),
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (BuildContext context, a1, a2) {
      return Scaffold(
        backgroundColor: Colors.transparent,//因为上级自带背景色，而此处设计需要透明遮罩所以需要此处设置透明才能显示出
        body: Stack(
          children: [
            Positioned(
              bottom: screen.calc(52),
              left: screen.calc(30),
              child: Container(
                width: screen.calc(690),
                height: screen.calc(908),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screen.calc(46)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [

                    Container(
                      child: Column(
                        children: [
                          Text('头'),
                        ],
                      ),
                    ),


                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
                          child: Text('aaa'),
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: screen.calc(111),
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: borderColor, width: 1)),
                        ),
                        child: Center(//避免上border被Text带歪只显示字体那么大的border
                          child: Text('关闭', style: TextStyle(fontSize: screen.calc(32),),),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  );

}