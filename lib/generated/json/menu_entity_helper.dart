import 'package:manager/entity/menu_entity.dart';
import 'package:manager/generated/json/base/json_convert_content.dart';

menuEntityFromJson(MenuEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['parent'] != null) {
    data.parent = json['parent']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toInt();
  }
  if (json['weight'] != null) {
    data.weight = json['weight']?.toInt();
  }
  if (json['path'] != null) {
    data.path = json['path']?.toString();
  }
  if (json['icon'] != null) {
    data.icon = json['icon']?.toInt();
  }
  if (json['enable'] != null) {
    data.enable = json['enable'];
  }
  if (json['child'] != null) {
    data.child = JsonConvert.fromJsonAsT(json['child']);
  }
  if (json['deleted'] != null) {
    data.deleted = json['deleted']?.toInt();
  }
  if (json['creatorId'] != null) {
    data.creatorId = json['creatorId']?.toString();
  }
  if (json['expanded'] != null) {
    data.expanded = json['expanded'];
  }
  return data;
}

Map<String, dynamic> menuEntityToJson(MenuEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['parent'] = entity.parent;
  data['name'] = entity.name;
  data['type'] = entity.type;
  data['weight'] = entity.weight;
  data['path'] = entity.path;
  data['icon'] = entity.icon;
  data['enable'] = entity.enable;
  if (entity.child != null) {
    data['child'] = entity.child.map((e) => e.toJson()).toList();
  }
  data['deleted'] = entity.deleted;
  data['creatorId'] = entity.creatorId;
  data['expanded'] = entity.expanded;
  return data;
}
