import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class CompanyEntity {
  String id;

  //公司名称
  String name;

  //联系电话
  String phone;

  //到期时间
  int expirationTime;

  //短信通知
  int smsNotification;

  //短信通知数量
  int smsCount;

  //短信通知总数
  int smsTotal;

  //状态
  int status;

  //纬度
  String latitude;

  //经度
  String longitude;

  //地址
  String address;

  //备注
  String note;
}
