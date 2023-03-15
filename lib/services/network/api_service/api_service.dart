import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_work/data/repositories/storage_repository.dart';
import 'package:open_work/services/network/api_service/api_client.dart';
import '../../../data/models/my_response/my_response_model.dart';
import '../../../data/models/user_register_dto/user_register_dto_model.dart';

class ApiService extends ApiClient {
  //------------------------AUTH REQUESTS------------------------
  Future<MyResponse> registerClient({
    required UserRegisterDtoModel userRegisterDtoModel,
  }) async {
    Dio dio = Dio();

    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.post(
        "http://3.126.92.10/users/register",
        data: userRegisterDtoModel.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("REGISTER  ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> registerWorker({
    required UserRegisterDtoModel userRegisterDtoModel,
  }) async {
    Dio dio = Dio();

    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.post(
        "http://3.126.92.10/workers/register",
        data: userRegisterDtoModel.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("REGISTER  ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> loginUser({
    required String password,
    required String email,
  }) async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        "http://3.126.92.10/users/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
        await StorageRepository.putString("token", response.data.toString());
      }
    } catch (error) {
      debugPrint("LOGIN ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  //------------------------BUSINESSES------------------------
  Future<MyResponse> createBusiness({
    required String startDate,
    required String endDate,
  }) async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response =
          await dio.post("${dio.options.baseUrl}busynesses", data: {
        "start": startDate,
        "end": endDate,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("CREATE BUSINESS ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

//------------------------CATEGORIES------------------------

//------------------------COMMENTS--------------------------

//------------------------CONFIRMATION----------------------

  Future<MyResponse> confirmEmail({required String email}) async {
    Dio dio = Dio();

    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.get("http://3.126.92.10/confirm/$email");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("CONFIRM ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> checkConfirmationCode({
    required int code,
    required String email,
  }) async {
    Dio dio = Dio();
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.post("http://3.126.92.10/confirm", data: {
        "email": email,
        "code": code,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("CONFIRM CODE  ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

//------------------------CLIENTS---------------------------

//------------------------WORKERS---------------------------
}
