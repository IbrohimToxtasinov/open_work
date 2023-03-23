import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/comment_create_dto/comment_create_dto_model.dart';
import 'package:open_work/data/models/update_user_dto/update_user_dto_model.dart';
import 'package:open_work/data/models/user_info/user_info_model.dart';
import 'package:open_work/data/models/user_info_base/user_info_base_model.dart';
import 'package:open_work/data/models/user_login_dto/user_login_dto_model.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:open_work/data/models/worker_login_dto/worker_login_dto_model.dart';
import 'package:open_work/data/models/worker_register_dto/worker_register_dto_model.dart';
import 'package:open_work/data/repositories/storage_repository.dart';
import 'package:open_work/services/network/api_service/api_client.dart';
import 'package:open_work/utils/constants.dart';
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
    required WorkerRegisterDtoModel workerRegisterDtoModel,
  }) async {
    Dio dio = Dio();

    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.post(
        "http://3.126.92.10/workers/register",
        data: FormData.fromMap({
          "Name": workerRegisterDtoModel.name,
          "Surname": workerRegisterDtoModel.surname,
          "Email": workerRegisterDtoModel.email,
          "Phone": workerRegisterDtoModel.phone,
          "Password": workerRegisterDtoModel.password,
        }),
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
    required UserLoginDtoModel userLoginDtoModel,
    required String path,
  }) async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        "http://3.126.92.10/$path/login",
        data: userLoginDtoModel.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        debugPrint("LOGIN SUCCESS");
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
  Future<MyResponse> getAllCategories() async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.get("${dio.options.baseUrl}categories");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = (response.data as List?)
                ?.map((e) => CategoryModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      debugPrint("GET ALL CATEGORIES ERROR: $error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

//------------------------COMMENTS--------------------------
  Future<MyResponse> createComment({
    required CommentCreateDtoModel commentCreateDtoModel,
  }) async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.post("${dio.options.baseUrl}comments",
          data: commentCreateDtoModel.toJson());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("CREATE COMMENT ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getWorkerCommentsById({required int workerId}) async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}comments/worker/$workerId");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = (response.data as List?)
                ?.map((e) => CategoryModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      debugPrint("GET WORKER COMMENTS BY ID ERROR :$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

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
  Future<MyResponse> getClientInfo() async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.get("${dio.options.baseUrl}users/me");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = UserInfoModel.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      debugPrint("GET CLIENT INFO ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getClientInfoBase() async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.get("${dio.options.baseUrl}users/me/base");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = UserInfoBaseModel.fromJson(response.data);
      }
    } catch (error) {
      debugPrint("GET CLIENT INFO BASE ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> deleteClient() async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.delete("${dio.options.baseUrl}users");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("DELETE CLIENT ERROR:$error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> putClient(
      {required UpdateUserDtoModel updateUserDtoModel}) async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.put(
        '${dio.options.baseUrl}/users',
        data: updateUserDtoModel,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      }
    } catch (error) {
      debugPrint("UPDATE CLIENT ERROR: $error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

//------------------------WORKERS SEARCH---------------------------
  Future<MyResponse> getWorkersSearch(
      {required List<int> allowedSkillsId, required int sortOptions}) async {
    MyResponse myResponse = MyResponse(errorMessage: '');
    try {
      Response response = await dio.post(
        "${dio.options.baseUrl}workers/search",
        data: {
          "allowedSkillsId": allowedSkillsId,
          "sortOptions": sortOptions,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = (response.data as List?)
                ?.map((element) => WorkerInfo.fromJson(element))
                .toList() ??
            [];
      }
    } catch (error) {
      debugPrint("GET WORKERS SEARCH: $error");
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }
}
