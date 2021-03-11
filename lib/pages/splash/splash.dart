import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('开屏页')),
      body: RaisedButton(
        color: Colors.blue,
        child: Text('跳转到首页'),
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }

}