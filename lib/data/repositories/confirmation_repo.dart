import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/services/network/api_service/api_service.dart';

class ConfirmationRepo {
  Future<MyResponse> sendCode(String email) {
    return getIt.get<ApiService>().confirmEmail(email: email);
  }

  Future<MyResponse> confirmEmail({required String email, required int code}) {
    return getIt.get<ApiService>().checkConfirmationCode(
          code: code,
          email: email,
        );
  }
}
