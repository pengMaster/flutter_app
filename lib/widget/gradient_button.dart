import 'package:flutter/material.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/5 6:00 PM
///     desc   : 渐变按钮
///     version: 1.0
/// </pre>
///
class GradientButton extends StatelessWidget {
  final _name;
  double _width;
  double _height;


  GradientButton(this._name,this._width,this._height) : super();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            //背景渐变
            borderRadius: BorderRadius.circular(3.0),
            //3像素圆角
            boxShadow: [
              //阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        child: Container(
          width: _width,
          height: _height,
          alignment: Alignment.center,
          child: Text(
            _name,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
