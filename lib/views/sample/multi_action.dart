import 'package:flutter/material.dart';
import 'package:flutter_app/views/sample/test.dart';
import 'package:flutter_app/utils/route_util.dart';
import 'package:flutter_app/views/sample/Infinite_listview.dart';

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
    print("init_MultiAction");
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
        children: <Widget>[Icon(Icons.ac_unit), Text("页面值传递")],
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
    ];
    setState(() {
      lists = lists1;
    });
  }
}
