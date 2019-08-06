import 'package:flutter/material.dart';
import 'package:flutter_app/widget/gradient_button.dart';
import 'package:flutter_app/utils/event_bus.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/5 5:53 PM
///     desc   : 事件总线
///     version: 1.0
/// </pre>
///
class EventBusAct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _EventBusAct();
  }
}

@override
void dispose() {
  bus.off("login");
}

class _EventBusAct extends State<EventBusAct> {
  var text = "默认";

  @override
  Widget build(BuildContext context) {
    _modifyText();
    return Scaffold(
      appBar: AppBar(
        title: Text("事件总线"),
      ),
      body: Center(
//        widthFactor: double.infinity,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(text),
              GestureDetector(
                onTap: _onBind,
                child: GradientButton("触发事件",464,88),
              )
            ],
          ),
//          color: Color.fromARGB(255, 255, 0, 0),
        ),
      ),
    );
  }

  void _onBind() {
    //绑定事件
    bus.emit("login", "我是EventBus发来的数据");
  }

  void _modifyText() {
    //修改数据
    //监听登录事件
    bus.on("login", (arg) {
      // do something
      setState(() {
        text = arg;
      });
    });
  }
}
