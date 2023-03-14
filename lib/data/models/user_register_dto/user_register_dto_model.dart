class UserRegisterDtoModel {
  final String name;
  final String surname;
  final String email;
  final String password;

  UserRegisterDtoModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  factory UserRegisterDtoModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterDtoModel(name: json["name"] as String? ?? "",
        surname: json["surname"] as String? ?? "",
        email: json["email"] as String? ?? "",
        password: json["password"] as String? ?? "");
  }
}
