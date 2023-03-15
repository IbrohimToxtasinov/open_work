part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
}

class CommentsInitial extends CommentsState {
  @override
  List<Object> get props => [];
}
