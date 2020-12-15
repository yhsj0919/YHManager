import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserEntity {
  String id;
  String userName;
  String nickName;
  int type;
  int deleted;
}
