import 'package:flutter_app/model/test_bean_entity.dart';
import 'package:flutter_app/api/common_result.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "TestBeanEntity") {
      return TestBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "CommonResult") {
      return CommonResult.fromJson(json) as T;
    } else {
      return null;
    }
  }
}