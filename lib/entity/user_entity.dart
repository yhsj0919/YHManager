import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserEntity {
  String id;
  String userName;
  String nickName;
  String passWord;
  String companyId;
  int type;
  int deleted;
}
