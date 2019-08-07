import 'package:flutter/material.dart';
import 'package:flutter_app/api/net_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/api/api.dart';
import 'package:flutter_app/api/result_data.dart';
import 'package:flutter_app/utils/flutter_screenutil.dart';

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

abstract class BaseWidgetState<T extends BaseWidget> extends State<T> {
  ///取消网络请求
  CancelToken cancelToken;

  ///获取请求链接
  Api api = Api.getInstance();

  ///进度条是否显示
  bool isShowLoading = false;

  ///页面是否存活
  bool isLiveActivity = false;

  ///更新页面状态
  State state;
  
  ScreenUtil screenUtil = ScreenUtil.getInstance();

  @override
  void initState() {
    isLiveActivity = true;
    state = this;
    cancelToken = new CancelToken();
    onCreate();
    super.initState();
  }

  @override
  void dispose() {
    onDestroy();
    isLiveActivity = false;
    cancelToken.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildWidget(context),
        loadingWidget(),
      ],
    );
  }

  ///页面创建
  void onCreate();

  ///页面销毁
  void onDestroy();

  ///返回UI控件 相当于setContentView()
  Widget buildWidget(BuildContext context);

  ///网络请求 - post
  netPost(String url, Map<String, dynamic> params) {
    return NetUtils.post(url, params, cancelToken);
  }

  ///显示加载提示框
  void showLoading() {
    if (null != state && isLiveActivity) {
      state.setState(() {
        isShowLoading = true;
      });
    }
  }

  ///隐藏加载提示框
  void hideLoading() {
    if (null != state && isLiveActivity) {
      state.setState(() {
        isShowLoading = false;
      });
    }
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

  ///加载进度框Widget
  Widget loadingWidget() {
    return Visibility(
      visible: isShowLoading,
      child: Container(
        //错误页面中心可以自己调整
        padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
        color: Colors.black12,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Container(
          width: screenUtil.setWidth(300),
          height: screenUtil.setHeight(300),
          alignment: Alignment.center,
          color: Color(0xa3000000),
          child:
              // 圆形进度条
              new CircularProgressIndicator(
            strokeWidth: 4.0,
            backgroundColor: Colors.blue,
            // value: 0.2,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ),
    );
  }
}
