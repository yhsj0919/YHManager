import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:manager/entity/app_resp_entity.dart';
import 'package:manager/entity/user_entity.dart';
import 'package:manager/http/http.dart';
import 'package:manager/http/http_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';

class AppApi {
  static Future login(Map<String, String> params) {
    return _post<UserEntity>("/login", params: params);
  }

  static Future getPermission({Map<String, String> param}) {
    return _post<UserEntity>("/permission/getPermission", params: param ?? {});
  }

  static Future<AppRespEntity<T>> _post<T>(String path, {Map<String, String> params}) async {
    var cookie =await Http().getCookieManager();

    HttpUtils.init(baseUrl: 'http://192.168.3.58:8080', interceptors: [cookie]);

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
