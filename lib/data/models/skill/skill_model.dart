class SkillModel {
  SkillModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    this.isSelected = false,
  });

  final int id;
  final String name;
  final String description;
  final int categoryId;
  bool isSelected;

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        description: json["description"] as String? ?? "",
        categoryId: json["categoryId"] as int? ?? 0,
        isSelected: json["value"] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "categoryId": categoryId,
      };
}
