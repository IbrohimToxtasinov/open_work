import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/data/models/comment/comment_model.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/repositories/comment_repo.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({required this.commentsRepo})
      : super(CommentsState(
      status: Status.PURE, error: "", comments: const [])) {
    on<FetchComments>(fetchComments);
  }

  final CommentsRepo commentsRepo;

  fetchComments(FetchComments event, Emitter<CommentsState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await commentsRepo.getWorkerCommentsById(workerId: event.workerId);
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(comments: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(
          state.copyWith(error: myResponse.errorMessage, status: Status.ERROR));
    }
  }
}
