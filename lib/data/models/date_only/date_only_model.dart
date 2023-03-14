class DateOnly {
  final int year;
  final int month;
  final int day;
  final int dayOfWeek;
  final int dayOfYear;
  final int dayNumber;

  DateOnly({
    required this.year,
    required this.month,
    required this.day,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dayNumber,
  });

  factory DateOnly.fromJson(Map<String, dynamic> json) {
    return DateOnly(
      year: json["year"] as int? ?? 0,
      month: json["month"] as int? ?? 0,
      day: json["day"] as int? ?? 0,
      dayOfWeek: json["dayOfWeek"] as int? ?? 0,
      dayOfYear: json["dayOfYear"] as int? ?? 0,
      dayNumber: json["dayNumber"] as int? ?? 0,
    );
  }
}
