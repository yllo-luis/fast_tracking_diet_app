import 'dart:convert';

class LocalFastingModel {
  LocalFastingModel({
    required this.userId,
    required this.fastingDateStart,
    this.fastingDateEnd,
    required this.isCurrent,
  });

  int userId;
  DateTime fastingDateStart;
  DateTime? fastingDateEnd;
  bool isCurrent;

  String toJson() {
    return jsonEncode(<String,dynamic>{
      'user_id': userId,
      'fasting_date_start': fastingDateStart.toIso8601String(),
      'fasting_date_end': fastingDateEnd?.toIso8601String(),
      'is_current': isCurrent ? 1 : 0,
    });
  }
}
