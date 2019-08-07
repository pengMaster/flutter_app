import 'package:flutter/material.dart';
import 'package:flutter_app/base/base_stateful_widget.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/6 4:19 PM
///     desc   :
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
        title: Text("取消网络加载"),
      ),
    );
  }

  @override
  void onCreate() async{
    showLoading();
    var params = {"countOrderId": "260774849608302592"};
    var res = await netPost(api.items, params);
    hideLoading();
    print(res.result);
  }

  @override
  void onDestroy() {}


}
