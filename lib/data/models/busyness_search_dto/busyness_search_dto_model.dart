import 'package:open_work/data/models/date_only/date_only_model.dart';
import 'package:open_work/data/models/time_only/time_only_model.dart';

class BusynessSearchDtoModel {
  final int workerId;
  final DateOnly toDate;
  final TimeOnly fromTime;
  final TimeOnly toTime;

  BusynessSearchDtoModel({
    required this.workerId,
    required this.toDate,
    required this.fromTime,
    required this.toTime,
  });

  factory BusynessSearchDtoModel.fromJson(Map<String, dynamic> json) {
    return BusynessSearchDtoModel(
      workerId: json["workerId"] as int? ?? 0,
      toDate: DateOnly.fromJson(json['toDate'] as Map<String, dynamic>? ?? {}),
      fromTime: TimeOnly.fromJson(json['fromTime'] as Map<String, dynamic>? ?? {}),
      toTime: TimeOnly.fromJson(json['toTime'] as Map<String, dynamic>? ?? {}),
    );
  }
}
