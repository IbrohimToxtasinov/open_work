import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:open_work/data/repositories/storage_repository.dart';

class WorkerApiClient {
  WorkerApiClient() {
    _init();
  }

  late Dio dio;
  String workerToken = 'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjkiLCJFbWFpbCI6InNhbWFuZGFyYWhhZGpvbm92c3NAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiV29ya2VyIiwiZXhwIjoxNjgxNjI3Mjc0LCJpc3MiOiJvcGVud29yay51eiIsImF1ZCI6Im9wZW53b3JrLnV6In0.biqW9tjHwcFnpzt3_pFUP-FP2ET74bvMPyjnSconYwQ';
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