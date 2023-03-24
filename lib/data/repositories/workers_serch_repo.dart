import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/services/network/api_service/api_service.dart';

class WorkersSearchRepo {
  Future<MyResponse> getWorkersSearch(
      {required List<int> allowedSkillsId, required int sortOptions}) {
    return getIt.get<ApiService>().getWorkersSearch(
        allowedSkillsId: allowedSkillsId, sortOptions: sortOptions);
  }
}
