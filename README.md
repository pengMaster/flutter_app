# flutter_app

脚手架

功能记录
- [网络请求 dio封装](https://github.com/pengMaster/flutter_app/blob/master/lib/api/net_utils.dart)
- [快捷创建解析实体类工具](https://github.com/zhangruiyu/FlutterJsonBeanFactory)
- 添加启动页
- 添加左滑抽屉
- 添加底部导航栏
- 底部导航栏 + 内容联动
- 添加网络请求更新数据 + json转实体
- 添加可以上拉加载，下拉刷新的listView
- [路由封装](https://github.com/pengMaster/flutter_app/blob/master/lib/utils/route_util.dart)
  - 添加动画 进入 从左到右 返回 从右到左
  - 带值跳转
  - 接收上个页面返回值
  - 跳转关闭当前页面
  - 跳转不关闭当前页面
- 去掉底部导航栏内容联动改为保持页面状态
- [动态申请权限](https://github.com/pengMaster/flutter_app/blob/master/lib/views/sample/permission_act.dart)
- 监听返回键，点击两下退出程序
- [渐变按钮封装](https://github.com/pengMaster/flutter_app/blob/master/lib/widget/gradient_button.dart)
  - 支持宽高定义
  - 支持文字定义
- [事件总线封装(非粘性)](https://github.com/pengMaster/flutter_app/blob/master/lib/utils/event_bus.dart)
- [新增屏幕适配工具](https://github.com/pengMaster/flutter_app/blob/master/lib/utils/flutter_screenutil.dart)
  - [页面使用](https://github.com/pengMaster/flutter_app/blob/master/lib/widget/gradient_button.dart)
- [BaseWidget封装](https://github.com/pengMaster/flutter_app/blob/master/lib/base/base_stateful_widget.dart)
  - [辅助工具类类BaseFunction](https://github.com/pengMaster/flutter_app/blob/master/lib/base/base_function.dart)
  - 统一管理页面网络请求，页面关闭取消掉本页面所有网络请求
  - 添加子类抽象方法 onCreate() onDestroy()
  - 加载框统一封装 showLoading()  hideLoading()
  - 网络请求中进度框提供可关闭 不可关闭两种方案
  - 集成功能性控件，自页面无需引入直接使用
  - 页面跳转：1.跳转可接受返回值不关闭当前页面 2.跳转关闭当前页面
  - 吐司 系统提示Toast
  - listView加载零部件(实际在BaseFunction中)



