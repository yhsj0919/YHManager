import 'package:manager/generated/json/base/json_convert_content.dart';

class AppRespEntity<T> {
  int code;
  String msg;
  T data;

  AppRespEntity(this.code, this.msg, this.data);

  AppRespEntity.fromJson(Map<String, dynamic> json) {
    if (json['code'] != null) {
      code = json['code']?.toInt();
    }
    if (json['msg'] != null) {
      msg = json['msg']?.toString();
    }
    if (json.containsKey('data')) {
      data = _generateOBJ<T>(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['msg'] = msg;
    data['data'] = data;

    return data;
  }

  String toString() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['code'] = code;
    map['msg'] = msg;
    map['data'] = data.toString();

    return map.toString();
  }

  T _generateOBJ<T>(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据由fromJsonAsT判断处理
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }
}