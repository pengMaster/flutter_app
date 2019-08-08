import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/base/base_stateful_widget.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/12 6:00 PM
///     desc   : 
///     version: 1.0
/// </pre>
///
class InfiniteListView extends BaseWidget {

  @override
  BaseWidgetState<BaseWidget> getState() {
    return new _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends BaseWidgetState<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];


  Future<Null> _retrieveData() async{
     await Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        _words = _words;
      });
    });
  }

  Future<Null> _refreshData() async{
    _words = <String>[loadingTag];
    await Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        _words = _words;
      });
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能页面"),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            //如果到了表尾
            if (_words[index] == loadingTag) {
              //不足100条，继续获取数据
              if (_words.length - 1 < 100) {
                //获取数据
                _retrieveData();
                //加载时显示loading
                return listViewLoadingBottom();
              } else {
                //已经加载了100条数据，不再获取数据。
                return listViewNoDataBottom();
              }
            }
            //显示单词列表项
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
        ),
      ),
    );
  }

  @override
  void onCreate() {
    _retrieveData();
  }

  @override
  void onDestroy() {
  }
}
