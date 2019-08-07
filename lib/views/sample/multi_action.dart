import 'package:flutter/material.dart';
import 'package:flutter_app/views/sample/test.dart';
import 'package:flutter_app/utils/route_util.dart';
import 'package:flutter_app/views/sample/Infinite_listview.dart';
import 'package:flutter_app/views/sample/permission_act.dart';
import 'package:flutter_app/views/sample/tab_view.dart';
import 'package:flutter_app/views/sample/event_bus_act.dart';
import 'package:flutter_app/views/sample/cancel_net_page.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/15 2:12 PM
///     desc   : 多功能列表
///     version: 1.0
/// </pre>
///
class MultiAction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MultiAction();
  }
}

class _MultiAction extends State<MultiAction> {
  var lists = [
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Icon(Icons.threesixty), Text("接受页面返回值")],
        )),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Icon(Icons.accessibility), Text("页面值传递")],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Icon(Icons.ac_unit), Text("分页ListView")],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Icon(Icons.account_balance), Text("动态申请权限")],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Icon(Icons.battery_std), Text("导航栏切换")],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Icon(Icons.gamepad), Text("事件总线")],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Icon(Icons.gamepad), Text("取消网络请求")],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.5 //宽高比为1时，子widget
          ),
      itemBuilder: (context, index) {
        return itemView(index);
      },
      itemCount: lists.length,
    );
  }

  Widget itemView(int index) {
    return new GestureDetector(
      child: lists[index],
      onTap: (){
        itemOnClick(index);
      },
    );
  }

  itemOnClick(int index){
    if(index == 0){
      toBackParamsAct();
    }else if(index == 1){
      startActivity(context, new TestPage("我是页面传过来的参数"));
    }else if(index == 2){
      startActivity(context, new InfiniteListView());
    }else if(index == 3){
      startActivity(context, new PermissionAct());
    }else if(index == 4){
      startActivity(context, new TabView());
    }else if(index == 5){
      startActivity(context, new EventBusAct());
    }else if(index == 6){
      startActivity(context, new CancelNetPage());
    }
  }


  void toBackParamsAct()async{
    var result = await startActivity(context,new TestPage(""));
    var lists1 = [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Icon(Icons.threesixty), Text(result)],
          )),
    ];
    setState(() {
      lists = lists1;
    });
  }
}
