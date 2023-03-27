part of 'comments_bloc.dart';

abstract class CommentsEvent {}

class FetchComments extends CommentsEvent {
  final int workerId;

  FetchComments({required this.workerId});
}

class CreateComment extends CommentsEvent {
  final CommentCreateDtoModel commentCreateDtoModel;

  CreateComment({required this.commentCreateDtoModel});
}
