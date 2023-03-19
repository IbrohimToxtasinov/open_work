class WorkerBusiness {
  WorkerBusiness({
    required this.workerId,
    required this.start,
    required this.end,
    required this.id,
  });

  final int workerId;
  final String start;
  final String end;
  final int id;

  factory WorkerBusiness.fromJson(Map<String, dynamic> json) => WorkerBusiness(
        workerId: json["workerId"] as int? ?? 0,
        start: json["start"] as String? ?? "",
        end: json["end"] as String? ?? "",
        id: json["id"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "workerId": workerId,
        "start": start,
        "end": end,
        "id": id,
      };
}
