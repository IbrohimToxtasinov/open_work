import 'package:image_picker/image_picker.dart';
import 'package:open_work/utils/file_importer/file_importer.dart';

class WorkerRepository {
  Future<MyResponse> getWorkerInfo() async =>
      await getIt<WorkerApiService>().getWorkerInfo();

  Future<MyResponse> deleteWorker() async =>
      await getIt<WorkerApiService>().deleteWorker();
  Future<MyResponse> addSkill(int id) async =>
      await getIt<WorkerApiService>().skillAdd(id);

  Future<MyResponse> updateWorkerInfo(
          {required String name,
          required String surname,
          required String email,
          required String phone,
          required String password,
          required XFile file}) async =>
      await getIt<WorkerApiService>().updateWorker(
          name: name,
          surname: surname,
          email: email,
          phone: phone,
          password: password,
          file: file);
}
