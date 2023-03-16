import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:open_work/data/repositories/storage_repository.dart';

class WorkerApiClient {
  WorkerApiClient() {
    _init();
  }

  late Dio dio;
  String workerToken = 'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjExIiwiRW1haWwiOiJzYW1hbmRhcmFoYWRqb25vdnNzQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IldvcmtlciIsImV4cCI6MTY4MTYzMzA1MywiaXNzIjoib3BlbndvcmsudXoiLCJhdWQiOiJvcGVud29yay51eiJ9.ihJsC54FtSP9rVUPuaGM15FOT7IConO_zu4ixYRpg1M';
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
      String token = StorageRepository.getString("token",defValue: workerToken);
      requestOptions.headers["Authorization"] = "Bearer $token";
      requestOptions.headers["accept"] = "application/json";
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("RESPONSE HAS RECEIVED");
      return handler.next(response);
    }));
  }
}