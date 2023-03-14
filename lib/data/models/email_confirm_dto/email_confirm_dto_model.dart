class EmailConfirmDtoModel {
  final String email;
  final int code;

  EmailConfirmDtoModel({
    required this.email,
    required this.code,
  });

  factory EmailConfirmDtoModel.fromJson(Map<String, dynamic> json) {
    return EmailConfirmDtoModel(
      email: json["email"] as String? ?? "",
      code: json["code"] as int? ?? 0,
    );
  }
}
