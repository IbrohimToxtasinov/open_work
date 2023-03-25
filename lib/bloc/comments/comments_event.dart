part of 'comments_bloc.dart';

abstract class CommentsEvent {}

class FetchComments extends CommentsEvent {
  final int workerId;

  FetchComments({required this.workerId});
}
