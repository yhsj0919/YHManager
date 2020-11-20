import 'package:manager/entity/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['userName'] != null) {
    data.userName = json['userName']?.toString();
  }
  if (json['nickName'] != null) {
    data.nickName = json['nickName']?.toString();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toInt();
  }
  if (json['deleted'] != null) {
    data.deleted = json['deleted']?.toInt();
  }
  return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['userName'] = entity.userName;
  data['nickName'] = entity.nickName;
  data['type'] = entity.type;
  data['deleted'] = entity.deleted;
  return data;
}
