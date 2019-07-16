import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///跳转页面 动画左右 可接受返回参数 不关闭当前页面
startActivity(BuildContext context, Widget routePage) {
  return Navigator.push(
      context,
      // 启用动画路由，在回退时也有效
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
          pageBuilder: (context, animation, secondaryAnimation) {
            return new SlideTransition(
                // 移动动画
                textDirection: TextDirection.ltr,
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: routePage);
          }));
}
///跳转页面 动画左右 关闭当前页面
void startActivityFinish(BuildContext context, Widget routePage) {
  Navigator.pushReplacement(
      context,
      // 启用动画路由，在回退时也有效
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
          pageBuilder: (context, animation, secondaryAnimation) {
            return new SlideTransition(
                // 移动动画
                textDirection: TextDirection.ltr,
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: routePage);
          }));
}

void pushAndRemovePage(BuildContext context, Widget routePage) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => routePage),
    (route) => route == null,
  );
}

void pushNewPage(BuildContext context, Widget routePage) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => routePage));
}

void pushNewPageBack(BuildContext context, Widget routePage) {
  Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => routePage));
}

void popAndPushNewPage(BuildContext context, String routeName) {
  Navigator.popAndPushNamed(context, routeName);
}

void pushReplacementName(BuildContext context, String routeName) {
  Navigator.pushReplacementNamed(context, routeName);
}
