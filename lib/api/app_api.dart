import 'package:manager/entity/app_resp_entity.dart';
import 'package:manager/entity/user_entity.dart';
import 'package:manager/http/http_utils.dart';

class AppApi {
  static Future login(Map<String, String> params) {
    return _post<UserEntity>("/login", params: params);
  }

  static Future<AppRespEntity<T>> _post<T>(String path, {Map<String, String> params}) async {
    HttpUtils.init(baseUrl: 'http://192.168.3.58:8080');

    try {
      var resp = await HttpUtils.post(path, data: params);

      AppRespEntity<T> data = AppRespEntity.fromJson(resp);
      if (data.code == 200) {
        return Future.value(data);
      } else {
        return Future.error(data.msg);
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
