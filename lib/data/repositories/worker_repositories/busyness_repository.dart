import 'package:open_work/utils/file_importer/file_importer.dart';

class BusynessRepository{
  Future<MyResponse> getBusynesses({required int workerId, required int itemCount}) async => await getIt<WorkerApiService>().getBusynesses(workerId: workerId, itemCount: itemCount);

  Future<MyResponse> deleteBusynessById(int busynessId) async => await getIt<WorkerApiService>().deleteBusynessById(busynessId);

  Future<MyResponse> createBusyness({required DateTime start, required DateTime end}) async =>
      await getIt<WorkerApiService>().createBusyness(start: start, end: end);
}