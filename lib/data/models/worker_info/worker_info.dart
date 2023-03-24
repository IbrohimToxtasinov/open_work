import 'package:open_work/data/models/skil/skil_model.dart';

class WorkerInfoModel {
  WorkerInfoModel({
    required this.email,
    required this.phone,
    required this.skills,
    required this.name,
    required this.surname,
    required this.lastSeen,
    required this.rating,
    required this.image,
    required this.id,
  });

  final String email;
  final String phone;
  final List<Skill> skills;
  final String name;
  final String surname;
  final String lastSeen;
  final num rating;
  final String image;
  final int id;

  factory WorkerInfoModel.fromJson(Map<String, dynamic> json) =>
      WorkerInfoModel(
        email: json["email"] as String? ?? "",
        phone: json["phone"] as String? ?? "",
        skills: (json['skills'] as List? ?? [])
            .map((e) => Skill.fromJson(e))
            .toList(),
        name: json["name"] as String? ?? "",
        surname: json["surname"] as String? ?? "",
        lastSeen: json["lastSeen"] as String? ?? "",
        rating: json["rating"] as num? ?? 0.0,
        image: json["image"] as String? ?? "https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png",
        id: json["id"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "name": name,
        "surname": surname,
        "lastSeen": lastSeen,
        "rating": rating,
        "image": image,
        "id": id,
      };
}
