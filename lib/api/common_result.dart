///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/7 8:35 PM
///     desc   : 通用返回数据解析类
///     version: 1.0
/// </pre>
///

class CommonResult {
	dynamic total;
	String code;
	dynamic data;
	bool newUser;
	dynamic messageObject;
	String message;
	bool status;

	CommonResult({this.total, this.code, this.data, this.newUser, this.messageObject, this.message, this.status});

	CommonResult.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		code = json['code'];
		data = json['data'];
		newUser = json['newUser'];
		messageObject = json['messageObject'];
		message = json['message'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['code'] = this.code;
		data['data'] = this.data;
		data['newUser'] = this.newUser;
		data['messageObject'] = this.messageObject;
		data['message'] = this.message;
		data['status'] = this.status;
		return data;
	}
}
