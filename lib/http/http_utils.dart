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
    return await Http().get(path, params: params, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
  }

  static Future post(String path, {Map<String, dynamic> params, data, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    return await Http().post(path, data: data, params: params, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress, onSendProgress: onSendProgress);
  }

  static Future put(String path, {data, Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    return await Http().put(path, data: data, params: params, options: options, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
  }

  static Future patch(String path, {data, Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    return await Http().patch(path, data: data, params: params, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress, onSendProgress: onSendProgress);
  }

  static Future delete(String path, {data, Map<String, dynamic> params, Options options, CancelToken cancelToken}) async {
    return await Http().delete(path, data: data, params: params, options: options, cancelToken: cancelToken);
  }

  static Future postForm(String path, {Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    return await Http().postForm(path, params: params, options: options, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
  }

  static Future download(String path, String savePath, {Map<String, dynamic> params, data, bool deleteOnError = true, ProgressCallback onReceiveProgress, Options options, CancelToken cancelToken}) async {
    return await Http().download(path, savePath, data: data, params: params, deleteOnError: deleteOnError, onReceiveProgress: onReceiveProgress, options: options, cancelToken: cancelToken);
  }
}
