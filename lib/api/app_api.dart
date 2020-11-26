import 'package:manager/entity/app_resp_entity.dart';
import 'package:manager/entity/menu_entity.dart';
import 'package:manager/entity/user_entity.dart';
import 'package:manager/http/http.dart';
import 'package:manager/http/http_utils.dart';

class AppApi {
  //登录
  static Future login(Map<String, String> params) {
    return _post<UserEntity>("/login", params: params);
  }

  //获取权限
  static Future<AppRespEntity<List<MenuEntity>>> getPermission({Map<String, dynamic> param}) {
    return _post<List<MenuEntity>>("/permission/getPermission", params: param ?? {});
  }

  //添加权限
  static Future<AppRespEntity<List<MenuEntity>>> addPermission({Map<String, dynamic> param}) {
    return _post<List<MenuEntity>>("/permission/addPermission", params: param ?? {});
  }

  //公共请求方法
  static Future<AppRespEntity<T>> _post<T>(String path, {Map<String, dynamic> params}) async {
    var cookie = await Http().getCookieManager();

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
