class UpdateUserDtoModel {
  final String name;
  final String surname;
  final String email;
  final String password;

  UpdateUserDtoModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  factory UpdateUserDtoModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserDtoModel(
        name: json["name"] as String? ?? "",
        surname: json["surname"] as String? ?? "",
        email: json["email"] as String? ?? "",
        password: json["password"] as String? ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "email": email,
      "password": password
    };
  }
}