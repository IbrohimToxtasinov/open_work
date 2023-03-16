import 'package:open_work/data/models/user_login_dto/user_login_dto_model.dart';
import 'package:open_work/data/models/worker_register_dto/worker_register_dto_model.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/services/network/api_service/api_service.dart';

import '../models/my_response/my_response_model.dart';
import '../models/user_register_dto/user_register_dto_model.dart';

class AuthRepo {
  Future<MyResponse> confirmEmail({required String email}) =>
      getIt.get<ApiService>().confirmEmail(email: email);

  Future<MyResponse> checkConfirmationCode({
    required int code,
    required String email,
  }) =>
      getIt.get<ApiService>().checkConfirmationCode(
            code: code,
            email: email,
          );

  Future<MyResponse> registerClient({
    required UserRegisterDtoModel userRegisterDtoModel,
  }) =>
      getIt
          .get<ApiService>()
          .registerClient(userRegisterDtoModel: userRegisterDtoModel);

  Future<MyResponse> registerWorker({
    required WorkerRegisterDtoModel workerRegisterDtoModel,
  }) =>
      getIt
          .get<ApiService>()
          .registerWorker(workerRegisterDtoModel: workerRegisterDtoModel);

  Future<MyResponse> loginUser(
          {required UserLoginDtoModel userLoginDtoModel,
          required String path}) =>
      getIt.get<ApiService>().loginUser(
            userLoginDtoModel: userLoginDtoModel,
            path: path,
          );
}
