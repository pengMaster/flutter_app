import 'package:flutter/material.dart';
import 'package:flutter_app/views/sample/home_drawer.dart';
import 'package:flutter_app/views/sample/Infinite_listview.dart';
import 'package:flutter_app/views/sample/test.dart';
import 'package:flutter_app/views/sample/multi_action.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/12 4:19 PM
///     desc   : 主页面
///     version: 1.0
/// </pre>
///
///

class MainAct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainActState();
  }
}

class _MainActState extends State<MainAct> with SingleTickerProviderStateMixin {

  TabController _tabController; //需要定义一个Controller
  List tabs = [ new MultiAction(),new MultiAction(), new MultiAction()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),//顶部标题栏
      drawer: new HomeDrawer(),//抽屉
      body: _tabBarView(),//内容切换区域
      bottomNavigationBar: _bottomNavigationBar()//底部导航栏
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  Widget _appBar(){///顶部标题栏
    return AppBar(
      //导航栏
      title: Text("App Name"),
      actions: <Widget>[
        //导航栏右侧菜单
        IconButton(icon: Icon(Icons.share), onPressed: () {}),
      ],
    );
  }

  Widget _tabBarView(){///内容切换区域
    return TabBarView(
      controller: _tabController,
      children: tabs.map((e) {
        //创建3个Tab页
        return Container(
          alignment: Alignment.center,
          child: e,
        );
      }).toList(),
    );
  }

  Widget _bottomNavigationBar(){///底部导航栏
    return BottomNavigationBar(
      // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.business), title: Text('Business')),
        BottomNavigationBarItem(
            icon: Icon(Icons.school), title: Text('School')),
      ],
      currentIndex: _tabController.index,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
