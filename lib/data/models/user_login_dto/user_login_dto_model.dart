class UserLoginDtoModel {
  final String email;
  final String password;

  UserLoginDtoModel({
    required this.email,
    required this.password
  });

  factory UserLoginDtoModel.fromJson(Map<String, dynamic> json) {
    return UserLoginDtoModel(
        email: json["email"] as String? ?? "",
        password: json["password"] as String? ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}