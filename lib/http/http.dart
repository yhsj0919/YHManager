import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:manager/http/cookie_storage.dart';

import 'error_interceptor.dart';

class Http {
  ///超时时间
  static const int CONNECT_TIMEOUT = 15000;
  static const int RECEIVE_TIMEOUT = 15000;

  static Http _instance = Http._internal();

  factory Http() => _instance;

  Dio dio;
  CancelToken _cancelToken = new CancelToken();

  Http._internal() {
    if (dio == null) {
      // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
      BaseOptions options = new BaseOptions(
          connectTimeout: CONNECT_TIMEOUT,
          // 响应流上前后两次接受到数据的间隔，单位为毫秒。
          receiveTimeout: RECEIVE_TIMEOUT,
          // Http请求头.
          headers: {});

      options.extra['withCredentials'] = true;

      dio = Dio(options);

      // 添加拦截器
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      dio.interceptors.add(ErrorInterceptor());
    }
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  Future<void> init({String baseUrl, int connectTimeout, int receiveTimeout, List<Interceptor> interceptors}) async {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;

    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  Future<CookieManager> getCookieManager([String storageName]) async {
    //本地管理cookie
    return CookieManager(PersistCookieJar(storage: CookieStorage()));
  }

  /// 设置headers
  void setHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

/*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({CancelToken token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  ///  get
  Future get(String path, {Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onReceiveProgress}) async {
    Options requestOptions = options ?? Options();
    var response = await dio.get(path, queryParameters: params, options: requestOptions, cancelToken: cancelToken ?? _cancelToken, onReceiveProgress: onReceiveProgress);
    return response.data;
  }

  ///  post
  Future post(String path,
      {Map<String, dynamic> params, data, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    Options requestOptions = options ?? Options();
    var response = await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
    return response.data;
  }

  ///  put 操作
  Future put(String path,
      {data, Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    Options requestOptions = options ?? Options();
    var response = await dio.put(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return response.data;
  }

  ///  patch
  Future patch(String path,
      {data, Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    Options requestOptions = options ?? Options();
    var response = await dio.patch(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
    return response.data;
  }

  ///  delete
  Future delete(String path, {data, Map<String, dynamic> params, Options options, CancelToken cancelToken}) async {
    Options requestOptions = options ?? Options();

    var response = await dio.delete(path, data: data, queryParameters: params, options: requestOptions, cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  ///  post form 表单提交
  Future postForm(String path, {Map<String, dynamic> params, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) async {
    Options requestOptions = options ?? Options();

    var response = await dio.post(path,
        data: FormData.fromMap(params), options: requestOptions, cancelToken: cancelToken ?? _cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
    return response.data;
  }

  ///  download 下载
  Future download(String path, String savePath,
      {Map<String, dynamic> params, data, bool deleteOnError = true, ProgressCallback onReceiveProgress, Options options, CancelToken cancelToken}) async {
    Options requestOptions = options ?? Options();

    var response = await dio.download(path, savePath,
        data: data, queryParameters: params, deleteOnError: deleteOnError, onReceiveProgress: onReceiveProgress, options: requestOptions, cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }
}
