
///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/7 8:35 PM
///     desc   : 返回数据传输
///     version: 1.0
/// </pre>
///
///
class ResultData {
  var data;
  bool result;
  int code;
  var headers;

  ResultData(this.data, this.result, this.code, {this.headers});
}
