class BusynessCreateDtoModel {
  final String start;
  final String end;

  BusynessCreateDtoModel({required this.start, required this.end});

  factory BusynessCreateDtoModel.fromJson(Map<String, dynamic> json) {
    return BusynessCreateDtoModel(
      start: json["start"] as String? ?? "",
      end: json["end"] as String? ?? "",
    );
  }
}
