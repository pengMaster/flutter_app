class TestBeanEntity {
	dynamic total;
	String code;
	TestBeanData data;
	bool newUser;
	dynamic messageObject;
	String message;
	bool status;

	TestBeanEntity({this.total, this.code, this.data, this.newUser, this.messageObject, this.message, this.status});

	TestBeanEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		code = json['code'];
		data = json['data'] != null ? new TestBeanData.fromJson(json['data']) : null;
		newUser = json['newUser'];
		messageObject = json['messageObject'];
		message = json['message'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['newUser'] = this.newUser;
		data['messageObject'] = this.messageObject;
		data['message'] = this.message;
		data['status'] = this.status;
		return data;
	}
}

class TestBeanData {
	int backNum;
	int outNum;

	TestBeanData({this.backNum, this.outNum});

	TestBeanData.fromJson(Map<String, dynamic> json) {
		backNum = json['backNum'];
		outNum = json['outNum'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['backNum'] = this.backNum;
		data['outNum'] = this.outNum;
		return data;
	}
}
