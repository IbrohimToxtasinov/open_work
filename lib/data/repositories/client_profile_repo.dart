import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/models/update_user_dto/update_user_dto_model.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/services/network/api_service/api_service.dart';

class ClientProfileRepo {
  Future<MyResponse> getClientInfo() {
    return getIt.get<ApiService>().getClientInfo();
  }

  Future<MyResponse> getClientInfoBase() {
    return getIt.get<ApiService>().getClientInfoBase();
  }

  Future<MyResponse> deleteClient() {
    return getIt.get<ApiService>().deleteClient();
  }

  Future<MyResponse> putClient(
      {required UpdateUserDtoModel updateUserDtoModel}) {
    return getIt
        .get<ApiService>()
        .putClient(updateUserDtoModel: updateUserDtoModel);
  }
}
