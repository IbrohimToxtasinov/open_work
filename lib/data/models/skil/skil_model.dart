class Skill {
  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
  });

  final int id;
  final String name;
  final String description;
  final int categoryId;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        description: json["description"] as String? ?? "",
        categoryId: json["categoryId"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "categoryId": categoryId,
      };
}
