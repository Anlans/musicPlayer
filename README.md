# musicplayer

A new Flutter project for college.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### dayOne 开屏页的设计(等待后台加载)
Navigator.pushReplacementNamed(context, '/home');
screen.padding.top
screen.size.width  逻辑像素

/widgets 作为通用的组件文件夹(可重用)
/home 首页文件夹
header.dart置顶手机状态栏
banner.dart滚动条
category目录

banner.dart
轮播图
用到了carousel_slider(很有趣的小公举)
