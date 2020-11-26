import 'package:manager/generated/json/base/json_convert_content.dart';

class MenuEntity with JsonConvert<MenuEntity> {
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
