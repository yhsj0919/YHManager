import 'package:manager/entity/app_resp_entity.dart';
import 'package:manager/entity/company_entity.dart';
import 'package:manager/entity/menu_entity.dart';
import 'package:manager/entity/user_entity.dart';
import 'package:manager/http/http.dart';
import 'package:manager/http/http_utils.dart';

class AppApi {
  AppApi._();

  static var _init = false;

  //登录
  static Future login(Map<String, String> params) {
    return _post<UserEntity>("/login", params: params);
  }

  //获取权限
  static Future<AppRespEntity<List<MenuEntity>>> getPermission({Map<String, dynamic> param}) {
    return _post<List<MenuEntity>>("/permission/get", params: param ?? {});
  }

  //添加权限
  static Future<AppRespEntity<List<MenuEntity>>> addPermission({Map<String, dynamic> param}) {
    return _post<List<MenuEntity>>("/permission/add", params: param ?? {});
  }

  //获取公司
  static Future<AppRespEntity<List<CompanyEntity>>> getCompany({Map<String, dynamic> param}) {
    return _post<List<CompanyEntity>>("/company/get", params: param ?? {});
  }

  //添加公司
  static Future<AppRespEntity<CompanyEntity>> addCompany({Map<String, dynamic> param}) {
    return _post<CompanyEntity>("/company/add", params: param ?? {});
  }

  //获取管理员
  static Future<AppRespEntity<UserEntity>> getCompanyAdmin({Map<String, dynamic> param}) {
    return _post<UserEntity>("/company/admin/get", params: param ?? {});
  }

  //设置管理员
  static Future<AppRespEntity<UserEntity>> setCompanyAdmin({Map<String, dynamic> param}) {
    return _post<UserEntity>("/company/admin/set", params: param ?? {});
  }

  //公共请求方法
  static Future<AppRespEntity<T>> _post<T>(String path, {Map<String, dynamic> params}) async {
    if (!_init) {
      var cookie = await Http().getCookieManager();
      HttpUtils.init(
        baseUrl: 'http://192.168.3.110:8080',
        interceptors: [cookie],
        connectTimeout: 30000,
      );
      _init = true;
    }

    return HttpUtils.post(path, data: params).then((value) {
      AppRespEntity<T> data = AppRespEntity.fromJson(value);
      if (data.code == 200) {
        return Future.value(data);
      } else {
        return Future.error(data.msg);
      }
    });
  }
}
