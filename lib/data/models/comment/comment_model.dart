import 'package:open_work/data/models/user_info/user_info_model.dart';
import 'package:open_work/data/models/worker_info/worker_info_model.dart';

class CommentModel {
  CommentModel({
    required this.content,
    required this.user,
    required this.worker,
    required this.created,
    required this.satisfied,
    required this.id,
  });

  final String content;
  final UserInfoModel user;
  final WorkerInfoModel worker;
  final String created;
  final bool satisfied;
  final int id;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        content: json["content"] as String? ?? "",
        user:
            UserInfoModel.fromJson(json["user"] as Map<String, dynamic>? ?? {}),
        worker: WorkerInfoModel.fromJson(
            json["worker"] as Map<String, dynamic>? ?? {}),
        created: json["created"] as String? ?? "",
        satisfied: json["satisfied"] as bool? ?? false,
        id: json["id"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "user": user.toJson(),
        "worker": worker.toJson(),
        "created": created,
        "satisfied": satisfied,
        "id": id,
      };
}
