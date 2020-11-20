import 'package:dio/dio.dart';
import 'http.dart';

class HttpUtils {
  static void init({String baseUrl, int connectTimeout, int receiveTimeout, List<Interceptor> interceptors}) {
    Http().init(baseUrl: baseUrl, connectTimeout: connectTimeout, receiveTimeout: receiveTimeout, interceptors: interceptors);
  }

  static void setHeaders(Map<String, dynamic> map) {
    Http().setHeaders(map);
  }

  static void cancelRequests({CancelToken token}) {
    Http().cancelRequests(token: token);
  }

  static Future get(String path, {Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onReceiveProgress}) async {
    try {
      var resp = await Http().get(path, params: params, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
      return Future.value(resp);
    } catch (e) {
      DioError d = e;
      return Future.error(d.error);
    }
  }

  static Future post(String path, {Map<String, dynamic> params, data, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    try {
      var resp = await Http().post(path, data: data, params: params, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress, onSendProgress: onSendProgress);
      return Future.value(resp);
    } catch (e) {
      DioError d = e;
      return Future.error(d.error);
    }
  }

  static Future put(String path, {data, Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    try {
      var resp = await Http().put(path, data: data, params: params, options: options, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
      return Future.value(resp);
    } catch (e) {
      DioError d = e;
      return Future.error(d.error);
    }
  }

  static Future patch(String path, {data, Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    try {
      var resp = await Http().patch(path, data: data, params: params, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress, onSendProgress: onSendProgress);
      return Future.value(resp);
    } catch (e) {
      DioError d = e;
      return Future.error(d.error);
    }
  }

  static Future delete(String path, {data, Map<String, dynamic> params, Options options, CancelToken cancelToken}) async {
    try {
      var resp = await Http().delete(path, data: data, params: params, options: options, cancelToken: cancelToken);
      return Future.value(resp);
    } catch (e) {
      DioError d = e;
      return Future.error(d.error);
    }
  }

  static Future postForm(String path, {Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    try {
      var resp = await Http().postForm(path, params: params, options: options, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
      return Future.value(resp);
    } catch (e) {
      DioError d = e;
      return Future.error(d.error);
    }
  }

  static Future download(String path, String savePath,
      {Map<String, dynamic> params, data, bool deleteOnError = true, ProgressCallback onReceiveProgress, Options options, CancelToken cancelToken}) async {
    try {
      var resp = await Http().download(path, savePath, data: data, params: params, deleteOnError: deleteOnError, onReceiveProgress: onReceiveProgress, options: options, cancelToken: cancelToken);
      return Future.value(resp);
    } catch (e) {
      DioError d = e;
      return Future.error(d.error);
    }
  }
}
