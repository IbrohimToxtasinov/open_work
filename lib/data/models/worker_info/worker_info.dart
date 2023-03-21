class WorkerInfo {
  WorkerInfo({
    required this.name,
    required this.surname,
    required this.lastSeen,
    required this.id,
    required this.rating,
  });

  final String name;
  final String surname;
  final String lastSeen;
  final double rating;
  final int id;

  factory WorkerInfo.fromJson(Map<String, dynamic> json) => WorkerInfo(
    name: json["name"] as String? ?? "",
    surname: json["surname"] as String? ?? "",
    lastSeen: json["lastSeen"] as String? ?? "",
    rating: json["rating"] as double? ?? 0.0,
    id: json["id"] as int? ?? 0,
  );
}