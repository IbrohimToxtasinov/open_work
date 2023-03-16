class UserInfoModel {
  UserInfoModel({
    required this.email,
    required this.name,
    required this.surname,
    required this.admin,
    required this.id,
  });

  final String email;
  final String name;
  final String surname;
  final bool admin;
  final int id;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        email: json["email"] as String? ?? "",
        name: json["name"] as String? ?? "",
        surname: json["surname"] as String? ?? "",
        admin: json["admin"] as bool? ?? false,
        id: json["id"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "surname": surname,
        "admin": admin,
        "id": id,
      };
}
