import 'dart:developer';
import 'package:dio/dio.dart';
export 'package:dio/src/dio_exception.dart';

class DioUtil {
  Dio? _instance;
  Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }

  Dio createDioInstance() {
    var dio = Dio();
    dio.interceptors.clear();

    int retryCount = 0;
    return dio
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        // final token =
        //     SharedPreferencesHelper.instance.getData<String>('accesstoken');
        // if (token != null) {
        //   options.headers["Authorization"] = "Bearer $token";
        // }
        log(options.queryParameters.toString());
        options.headers["Access-Control-Allow-Origin"] = "*";
        options.headers['ngrok-skip-browser-warning'] = 'true';

        return handler.next(options); //modify your request
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (DioException e, handler) async {
        log(e.toString());
        log(e.requestOptions.uri.toString());
        log(e.stackTrace.toString());
        log(e.requestOptions.toString());
        if (e.response?.statusCode == 500 || e.response?.statusCode == 400) {
          return handler.next(e);
        }
        return handler.next(e);
      }));
  }
}
