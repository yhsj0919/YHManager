import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MenuEntity {
	String id;
	String parent;
	String name;
	int type;
	int weight;
	String path;
	int icon;
	bool enable;
	List<MenuEntity> child;
	int deleted;
	String creatorId;
	bool expanded;
}
