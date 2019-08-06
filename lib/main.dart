import 'package:flutter/material.dart';
import 'package:flutter_app/views/splash_screen.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';


void main() async {
  runZoned(() {
    /// 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
        .then((_) {
      runApp(MyApp());

      if (Platform.isAndroid) {
        // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    });
  }, onError: (Object error, StackTrace stack) {
    print(error);
    print(stack);
  });
}


class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: SplashScreenPage(),
    );
  }
}


