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

  Future<MyResponse> registerUser({
    required UserRegisterDtoModel userRegisterDtoModel,
  }) =>
      getIt
          .get<ApiService>()
          .registerClient(userRegisterDtoModel: userRegisterDtoModel);

  Future<MyResponse> loginUser({
    required String password,
    required String email,
  }) =>
      getIt.get<ApiService>().loginUser(password: password, email: email);
}
