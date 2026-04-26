import 'dart:convert';

class LocalFastingModel {
  int? id;
  int userId;
  DateTime fastingDateStart;
  DateTime? fastingDateEnd;
  bool isCurrent;

  LocalFastingModel({
    this.id,
    required this.userId,
    required this.fastingDateStart,
    this.fastingDateEnd,
    required this.isCurrent,
  });

  factory LocalFastingModel.fromMap(Map<String, dynamic> map) {
    return LocalFastingModel(
      id: map['id'] as int?,
      userId: map['user_id'] as int,
      fastingDateStart: DateTime.parse(map['date_start'] as String),
      fastingDateEnd: map['date_end'] != null ? DateTime.parse(map['date_end'] as String) : null,
      isCurrent: map['is_current'] == 1,
    );
  }

  String toJson() {
    return jsonEncode(<String,dynamic>{
      'user_id': userId,
      'fasting_date_start': fastingDateStart.toIso8601String(),
      'fasting_date_end': fastingDateEnd?.toIso8601String(),
      'is_current': isCurrent ? 1 : 0,
    });
  }
}
