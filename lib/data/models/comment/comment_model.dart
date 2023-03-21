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
  final User user;
  final Worker worker;
  final String created;
  final bool satisfied;
  final int id;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    content: json["content"] as String? ?? "",
    user: User.fromJson(json["user"] as Map<String, dynamic>? ?? {}),
    worker: Worker.fromJson(json["worker"]  as Map<String, dynamic>? ?? {}),
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

class User {
  User({
    required this.name,
    required this.surname,
    required this.admin,
    required this.id,
  });

  final String name;
  final String surname;
  final bool admin;
  final int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    surname: json["surname"],
    admin: json["admin"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "admin": admin,
    "id": id,
  };
}

class Worker {
  Worker({
    required this.name,
    required this.surname,
    required this.lastSeen,
    required this.rating,
    required this.id,
  });

  final String name;
  final String surname;
  final DateTime lastSeen;
  final int rating;
  final int id;

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
    name: json["name"],
    surname: json["surname"],
    lastSeen: DateTime.parse(json["lastSeen"]),
    rating: json["rating"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "lastSeen": lastSeen.toIso8601String(),
    "rating": rating,
    "id": id,
  };
}
