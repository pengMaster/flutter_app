///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/7 8:35 PM
///     desc   : 接口请求方法全局常量
///     version: 1.0
/// </pre>
///
class Api {

  // 静态私有成员，没有初始化
  static Api _instance;

  // 静态、同步、私有访问点
  static Api getInstance() {
    if (_instance == null) {
      _instance = new Api();
    }
    return _instance;
  }

  static const String BASE_URL = 'http://dev.dingdian.xin/ddaigo-platform/';

  static const String getStockOrderNum = 'stockIn/getStockOrderNum';
  String items = 'store/stockcount/result/items';
}
