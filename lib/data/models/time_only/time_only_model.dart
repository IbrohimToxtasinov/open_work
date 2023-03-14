class TimeOnly {
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int ticks;

  TimeOnly({
    required this.hour,
    required this.minute,
    required this.second,
    required this.millisecond,
    required this.ticks,
  });

  factory TimeOnly.fromJson(Map<String, dynamic> json) {
    return TimeOnly(hour: json["hour"] as int? ?? 0,
        minute: json["minute"] as int? ?? 0,
        second: json["second"] as int? ?? 0,
        millisecond: json["millisecond"] as int? ?? 0,
        ticks: json["ticks"] as int? ?? 0,
    );
  }
}

