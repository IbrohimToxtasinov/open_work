import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/services/network/worker_api_service/worker_api_client.dart';

class WorkerApiService extends WorkerApiClient{

  //Busyness CRUD

   Future<MyResponse> createBusyness({required DateTime start, required DateTime end}) async{
    MyResponse myResponse = MyResponse();
    Map<String,dynamic> data ={
      "start": start.toIso8601String(),
      "end": end.toIso8601String()
    };
    
    try{
      Response response = await dio.post("${dio.options.baseUrl}busynesses",data: data);
      if(response.statusCode==200){
        myResponse.data=response.data;
        myResponse.statusCode=response.statusCode;
      }
    }catch(e){
      myResponse.errorMessage=e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getBusynesses({required int workerId, required int itemCount}) async{
    MyResponse myResponse = MyResponse();
    try{
      Response response = await dio.get("${dio.options.baseUrl}busynesses/$workerId?page=$itemCount");
      if(response.statusCode==200){
        myResponse.data=response.data;
        myResponse.statusCode=response.statusCode;
      }
    }catch(e){
      myResponse.errorMessage=e.toString();
    }
    return myResponse;

  }





  //Worker info CRUD
   Future<MyResponse> updateWorker({required String name,required String surname,required String email,required String phone,required String password,File? file}) async{

     MyResponse myResponse = MyResponse();
     FormData data = FormData.fromMap(
         {
           "Name":name,
           "Surname":surname,
           "Email":email,
           "Phone":phone,
           "Password":password,
           "Image": file==null?null: await MultipartFile.fromFile(file.path)
         }
     );

     try{
       Response response = await dio.put("${dio.options.baseUrl}workers",data: data);
       if(response.statusCode==200){
         myResponse.data=response.data;
         myResponse.statusCode=response.statusCode;
       }
     }catch(e){
       myResponse.errorMessage=e.toString();
     }
     return myResponse;
   }

   Future<MyResponse> deleteWorker() async{
     MyResponse myResponse = MyResponse();
     try{
       Response response = await dio.delete("${dio.options.baseUrl}workers");
       if(response.statusCode==200){
         myResponse.data=response.data;
         myResponse.statusCode=response.statusCode;
       }
     }catch(e){
       myResponse.errorMessage=e.toString();
     }
     return myResponse;
   }


   Future<MyResponse> getWorkerInfo() async{
     MyResponse myResponse = MyResponse();
     try{
       Response response = await dio.get("${dio.options.baseUrl}workers/worker");
       if(response.statusCode==200){
         myResponse.data=response.data;
         myResponse.statusCode=response.statusCode;
       }
     }catch(e){
       myResponse.errorMessage=e.toString();
     }
     return myResponse;

   }







}