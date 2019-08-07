import 'package:flutter/material.dart';
import 'package:flutter_app/api/net_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/api/api.dart';
import 'package:flutter_app/api/result_data.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/6 4:17 PM
///     desc   :
///     version: 1.0
/// </pre>
///
abstract class BaseWidget extends StatefulWidget {
  BaseWidgetState baseWidgetState;

  @override
  BaseWidgetState createState() {
    baseWidgetState = getState();
    return baseWidgetState;
  }

  BaseWidgetState getState();

  String getStateName() {
    return baseWidgetState.getClassName();
  }
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T>
    with WidgetsBindingObserver {
  ///取消网络请求
  CancelToken cancelToken;

  ///获取请求链接
  Api api = Api.getInstance();

  @override
  void initState() {
    cancelToken = new CancelToken();
    onCreate();
    super.initState();
  }

  @override
  void dispose() {
    onDestroy();
    cancelToken.cancel();
    super.dispose();
  }

  ///页面创建
  void onCreate();

  ///页面销毁
  void onDestroy();

  ///网络请求 - post
  netPost(String url, Map<String, dynamic> params) {
    return NetUtils.post(url, params, cancelToken);
  }

  ///获取页面名称
  String getClassName() {
    if (context == null) {
      return null;
    }
    String className = context.toString();
    if (className == null) {
      return null;
    }
    className = className.substring(0, className.indexOf("("));
    return className;
  }
}
