import 'package:dio/dio.dart';
import 'package:manager/http/http_utils.dart';
import 'package:xpath_parse/xpath_selector.dart';

class MovieApi {
  MovieApi._();

  static Future getDouDan({String url = 'https://www.douban.com/people/205055992/doulists/collect?start=0'}) async {
    var options = Options(headers: {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.67 Safari/537.36 Edg/87.0.664.47'});

    var html = await HttpUtils.get(url, options: options);

    var thisPage = XPath.source(html).query("//span[@class='thispage']/text()").get();
    var totalPage = XPath.source(html).query("//span[@class='thispage']/@data-total-page").get();
    var movies = XPath.source(html).query("//ul[@class='doulist-list']//li").list();

    var datas = movies
        .map((e) => {
              'id': XPath.source(e).query("//span[@class='collect-stat']/a[1]/@data-id").get(),
              'title': XPath.source(e).query("//h3[1]/a[1]/text()").get(),
              'url': XPath.source(e).query("//h3[1]/a[1]/@href").get(),
              'cover': XPath.source(e).query("//div[@class='doulist-cover']//img/@src").get(),
              'dsc': XPath.source(e).query("//p[@class='intro']/text()").get(),
            })
        .toList();

    var pages = {'thisPage': thisPage, "totalPage": totalPage, 'data': datas};

    return Future.value(pages);
  }
}
