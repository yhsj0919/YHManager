import 'package:manager/http/http_utils.dart';

class BingApi {
  static Future getWallpaper() {
    return HttpUtils.get('https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN');
  }
}
