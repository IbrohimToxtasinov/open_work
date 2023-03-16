import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:open_work/data/repositories/storage_repository.dart';

class WorkerApiClient {
  WorkerApiClient() {
    _init();
  }

  late Dio dio;
  String workerToken = '';

  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://3.126.92.10/",
        connectTimeout: 25000,
        receiveTimeout: 20000,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(onError: ((error, handler) {
      debugPrint('ERROR OCCURRED:${error.response?.statusCode}');
      return handler.next(error);
    }), onRequest: (requestOptions, handler) {
      String token = StorageRepository.getString("token");
      requestOptions.headers["Authorization"] = "Bearer $token";
      requestOptions.headers["accept"] = "application/json";
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("RESPONSE HAS RECEIVED");
      return handler.next(response);
    }));
  }
}