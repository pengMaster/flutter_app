import 'package:flutter/material.dart';
import 'package:flutter_app/base/base_stateful_widget.dart';
import 'package:flutter_app/widget/gradient_button.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/6 4:19 PM
///     desc   : base组件演示
///     version: 1.0
/// </pre>
///
class CancelNetPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return new _CancelNetPage();
  }
}

class _CancelNetPage extends BaseWidgetState<CancelNetPage> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Base控件展示"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: _onClickCancelLoading,
              child: GradientButton("开启可关闭的加载框", 500, 120),
            ),
            GestureDetector(
              onTap: _onClickLoading,
              child: GradientButton("开启不关闭的加载框", 500, 120),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: _onClickNet,
                child: GradientButton("开启网络加载", 500, 120),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: _onClickCancelNet,
                child: GradientButton("关闭页面并取消请求", 500, 120),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onCreate() {}

  @override
  void onDestroy() {}

  void _onClickCancelLoading() {
    showLoading(isLoadingClose: true);
  }

  void _onClickLoading() {
    showLoading();
  }

  void _onClickNet() async {
    showToast("正在加载数据");
    var params = {"countOrderId": "260774849608302592"};
    var res = await netPost(api.items, params);
  }

  void _onClickCancelNet() {
    Navigator.pop(context);
  }
}
