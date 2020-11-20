import 'package:manager/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	String id;
	String userName;
	String nickName;
	int type;
	int deleted;
}
