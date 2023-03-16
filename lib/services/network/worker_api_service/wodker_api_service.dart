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

}