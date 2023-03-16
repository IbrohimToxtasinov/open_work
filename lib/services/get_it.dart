import 'package:open_work/utils/file_importer/file_importer.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => WorkerApiService());
  getIt.registerLazySingleton(() => WorkerRepository());
  getIt.registerLazySingleton(() => BusynessRepository());
}
