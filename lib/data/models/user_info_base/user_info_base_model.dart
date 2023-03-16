class UserInfoBaseModel {
  UserInfoBaseModel({
    required this.name,
    required this.surname,
    required this.admin,
    required this.id,
  });

  final String name;
  final String surname;
  final bool admin;
  final int id;

  factory UserInfoBaseModel.fromJson(Map<String, dynamic> json) => UserInfoBaseModel(
    name: json["name"] as String? ?? "",
    surname: json["surname"] as String? ?? "",
    admin: json["admin"] as bool? ?? false,
    id: json["id"] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "admin": admin,
    "id": id,
  };
}
