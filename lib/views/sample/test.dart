import 'package:flutter/material.dart';

import 'package:flutter_app/api/net_utils.dart';
import 'package:flutter_app/api/api.dart';
import 'package:flutter_app/model/test_bean_entity.dart';
import 'package:toast/toast.dart';
import 'package:dio/dio.dart';

// ignore: must_be_immutable
class TestPage extends StatefulWidget {
  String title = "init";
  String params = "";

  @override
  State<StatefulWidget> createState() {
    return new TestState(params);
  }

  TestPage(String params){
    this.params = params;
  }
}

class TestState extends State<TestPage> {
  List<String> lists = [];
  String params = "";

  @override
  void initState() {
    super.initState();
    setListView();
  }
  TestState(String params){
    this.params = params;
  }

  void setListView() {///初始化ListView数据
//    var text =  ModalRoute.of(context).settings.arguments;
    var lists1 = ['网络请求更新数据', 'Toast','带参数返回上一页',params,'未定义','未定义'
    ,'未定义','未定义','未定义','未定义','未定义','未定义','未定义','未定义','未定义'];
    setState(() {
      lists = lists1;
    });
  }

  downLoadData() async {///第一条下载数据展示 - 方法如何返回值展示
    final params = {
      'data': {'storeNo': 'S00000001'}
    };
    var res = await NetUtils.post(Api.getStockOrderNum, params,new CancelToken());//如何请求展示
    if (res != null && res.result) {//如何解析数据展示
      TestBeanEntity bean = new TestBeanEntity.fromJson(res.data);
      return bean.data;
    }
  }

  void press() async {///浮动按钮点击事件 - 异步 + 数据更新

  }

  itemClick(int index)async {///item点击事件
    if(index == 0){
      var data = await downLoadData();
      var lists1 = [data.outNum.toString(), 'Toast'];
      setState(() {
        lists = lists1;
      });
    }else if(index == 1){
      Toast.show("我是个Toast", context);
    }else if(index == 2){
      Navigator.of(context).pop("我是返回参数");
    }
    print('itemClick：$index');
  }

  @override
  Widget build(BuildContext context) {
    print('lists.length:${lists.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text("功能页面"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return itemListView(index);
        },
        itemCount: lists.length,
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: press,
          child: new Icon(Icons.add),
      ),
    );
  }

  Widget itemListView(int index){ ///ListView 每条样式 - 控件如何拆分展示
    return new GestureDetector(
      onTap: () {
        itemClick(index);
      },
      child: new Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          height: 50.0,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.white10,
              border: new Border.all(color: Colors.blue, width: 0.3)),
          child: new Text(
            lists[index].toString(),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr, //文本方向
          )),
    );
  }
}
