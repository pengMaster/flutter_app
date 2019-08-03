import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/02 2:12 PM
///     desc   : 权限申请
///     version: 1.0
/// </pre>
///
class PermissionAct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PermissionAct();
  }
}

class _PermissionAct extends State<PermissionAct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("权限申请"),
      ),
      body: Center(
        child: new GestureDetector(
          onTap: onClickPermission,
          child: Text("点击申请权限"),
        ),
      ),
    );
  }
  ///申请权限
  void onClickPermission() async{
    print("onClickPermission");
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.camera]);

  }
}
