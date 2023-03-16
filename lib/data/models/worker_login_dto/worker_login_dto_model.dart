class WorkerLoginDtoModel {
  final String email;
  final String password;

  WorkerLoginDtoModel({
    required this.email,
    required this.password,
  });

  factory WorkerLoginDtoModel.fromJson(Map<String, dynamic> json) {
    return WorkerLoginDtoModel(
      email: json["email"] as String? ?? "",
      password: json["password"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
