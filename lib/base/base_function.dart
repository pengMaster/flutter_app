import 'package:flutter/material.dart';
import 'package:flutter_app/utils/flutter_screenutil.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/8 10:47 AM
///     desc   : 公共方法 - base中实现
///     version: 1.0
/// </pre>
///
class BaseFunction {

  ///加载进度框Widget
  Widget loadingWidget(bool isShowLoading,ScreenUtil screenUtil) {
    return Visibility(
      visible: isShowLoading,
      child: Container(
        //错误页面中心可以自己调整
        padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
        color: Colors.black12,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenUtil.setSp(10)), //3像素圆角
            gradient: LinearGradient(
                colors: [Color(0xa3000000), Color(0xa3000000)]), //背景渐变
          ),
          child: Container(
            width: screenUtil.setWidth(320),
            height: screenUtil.setWidth(320),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(strokeWidth: 4.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenUtil.setHeight(30)),
                  child: Text("正在加载中...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenUtil.setSp(33),
                          decoration: TextDecoration.none)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///listView底部正在加载...
  Widget listViewLoadingBottom(){
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(strokeWidth: 2.0)
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("正在加载中..."),
          )

        ],
      ),
    );
  }

  ///listView底部没有数据
  Widget listViewNoDataBottom(){
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
    );
  }
}
