part of 'comments_bloc.dart';

class CommentsState extends Equatable {
  Status status;
  String error;
  List<CommentModel> comments;

  CommentsState({
    required this.status,
    required this.error,
    required this.comments,
  });

  CommentsState copyWith({
    Status? status,
    String? error,
    List<CommentModel>? comments,
  }) {
    return CommentsState(
      error: error ?? this.error,
      comments: comments ?? this.comments,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, comments];
}
