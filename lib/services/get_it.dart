import 'package:get_it/get_it.dart';
import 'package:open_work/services/network/api_service/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
}
