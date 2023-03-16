class WorkerRegisterDtoModel {
  final String name;
  final String surname;
  final String email;
  final String password;
  final String phone;
  final String image;

  WorkerRegisterDtoModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.phone,
    required this.image,
  });

  factory WorkerRegisterDtoModel.fromJson(Map<String, dynamic> json) {
    return WorkerRegisterDtoModel(
      name: json["name"] as String? ?? "",
      surname: json["surname"] as String? ?? "",
      email: json["email"] as String? ?? "",
      password: json["password"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      image: json["image"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "email": email,
      "password": password,
      "phone": phone,
      "image": image,
    };
  }
}
