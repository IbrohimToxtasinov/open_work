import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/models/worker_business.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:open_work/services/network/worker_api_service/worker_api_client.dart';

class WorkerApiService extends WorkerApiClient {
  //Busyness CRUD

  Future<MyResponse> createBusyness(
      {required DateTime start, required DateTime end}) async {
    MyResponse myResponse = MyResponse();
    Map<String, dynamic> data = {
      "start": start.toIso8601String(),
      "end": end.toIso8601String()
    };

    print("DATES :${data.toString()}");

    try {
      Response response =
          await dio.post("${dio.options.baseUrl}busynesses", data: {
            "start": start.toIso8601String(),
            "end": end.toIso8601String()
          },);
      if (response.statusCode == 200) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorMessage = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getBusynesses(
      {required int workerId, required int itemCount}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}busynesses/$workerId");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List?)
                ?.map((e) => WorkerBusiness.fromJson(e))
                .toList() ??
            [];
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorMessage = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> deleteBusynessById(int busynessId) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response =
          await dio.delete("${dio.options.baseUrl}busynesses/$busynessId");
      if (response.statusCode == 200) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorMessage = e.toString();
    }
    return myResponse;
  }

  //Worker info CRUD
  Future<MyResponse> updateWorker({
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String password,
    required XFile file,
  }) async {
    MyResponse myResponse = MyResponse();
    String fileName = file.path.split('/').last;
    FormData data = FormData.fromMap({
      "Name": name,
      "Surname": surname,
      "Email": email,
      "Phone": phone,
      "Password": password,
      "Image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    print("UPDATING DATA:${data.toString()}");
    print("Name:$name");
    print("Surname:$surname");
    print("Email:$email");
    print("Password:$password");
    print("Image Path:${file.path}");

    try {
      Response response =
          await dio.put("${dio.options.baseUrl}workers", data: data);
      if (response.statusCode == 200) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorMessage = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> deleteWorker() async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.delete("${dio.options.baseUrl}workers");
      if (response.statusCode == 200) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorMessage = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getWorkerInfo() async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.get("${dio.options.baseUrl}workers/me");
      if (response.statusCode == 200) {
        myResponse.data = WorkerInfoModel.fromJson(response.data);
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorMessage = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> skillAdd(int id) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response =
          await dio.patch("${dio.options.baseUrl}skills/add/$id");
      if (response.statusCode == 200) {
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorMessage = e.toString();
    }
    return myResponse;
  }
}
