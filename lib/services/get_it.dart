import 'package:get_it/get_it.dart';
import 'package:open_work/data/repositories/worker_repositories/busyness_repository.dart';
import 'package:open_work/data/repositories/worker_repositories/worker_repository.dart';
import 'package:open_work/services/network/api_service/api_service.dart';
import 'package:open_work/services/network/worker_api_service/worker_api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => WorkerApiService());
  getIt.registerLazySingleton(() => WorkerRepository());
  getIt.registerLazySingleton(() => BusynessRepository());
}
