import 'package:open_work/data/models/skill/skill_model.dart';

class CategoryModel {
  CategoryModel({
    required this.name,
    required this.skills,
    required this.id,
  });

  final String name;
  final List<SkillModel> skills;
  final int id;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"] as String? ?? "",
        id: json["id"] as int? ?? 0,
        skills: (json['skills'] as List? ?? [])
            .map((e) => SkillModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "id": id,
      };
}
