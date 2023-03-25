import 'package:open_work/data/models/comment_create_dto/comment_create_dto_model.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/services/network/api_service/api_service.dart';

class CommentsRepo {
  Future<MyResponse> getWorkerCommentsById({required int workerId}) {
    return getIt.get<ApiService>().getWorkerCommentsById(workerId: workerId);
  }

  Future<MyResponse> createComment({required CommentCreateDtoModel commentCreateDtoModel}) {
    return getIt.get<ApiService>().createComment(commentCreateDtoModel: commentCreateDtoModel);
  }
}
