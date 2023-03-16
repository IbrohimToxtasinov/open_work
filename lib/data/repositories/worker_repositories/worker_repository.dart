import 'dart:io';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/services/network/worker_api_service/worker_api_service.dart';

class WorkerRepository{
  Future<MyResponse> getWorkerInfo() async => await getIt<WorkerApiService>().getWorkerInfo();

  Future<MyResponse> deleteWorker() async => await getIt<WorkerApiService>().deleteWorker();

  Future<MyResponse> updateWorkerInfo({required String name,required String surname,required String email,required String phone,required String password,File? file}) async =>
      await getIt<WorkerApiService>().updateWorker(name: name, surname: surname, email: email, phone: phone, password: password);


}