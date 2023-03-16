class CommentCreateDtoModel {
  final String content;
  final bool satisfied;
  final int workerId;

  CommentCreateDtoModel({
    required this.content,
    required this.satisfied,
    required this.workerId,
  });

  factory CommentCreateDtoModel.fromJson(Map<String, dynamic> json) {
    return CommentCreateDtoModel(
      content: json["content"] as String? ?? "",
      satisfied: json["satisfied"] as bool? ?? false,
      workerId: json["workerId"] as int? ?? 0,);
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "satisfied": satisfied,
      "workerId": workerId,
    };
  }
}