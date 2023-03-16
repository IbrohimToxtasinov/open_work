import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/services/network/worker_api_service/worker_api_service.dart';

class BusynessRepository{
  Future<MyResponse> getBusynesses({required int workerId, required int itemCount}) async => await getIt<WorkerApiService>().getBusynesses(workerId: workerId, itemCount: itemCount);

  Future<MyResponse> deleteWorker(int busynessId) async => await getIt<WorkerApiService>().deleteBusynessById(busynessId);

  Future<MyResponse> createBusyness({required DateTime start, required DateTime end}) async =>
      await getIt<WorkerApiService>().createBusyness(start: start, end: end);
}