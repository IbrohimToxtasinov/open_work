class SkillCreateDtoModel {
  final String name;
  final String description;
  final int categoryId;

  SkillCreateDtoModel({
    required this.name,
    required this.description,
    required this.categoryId,
  });

  factory SkillCreateDtoModel.fromJson(Map<String, dynamic> json) {
    return SkillCreateDtoModel(
      name: json["name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      categoryId: json["categoryId"] as int? ?? 0,
    );
  }
}