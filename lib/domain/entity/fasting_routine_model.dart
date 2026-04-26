import 'dart:convert';

class FastingRoutineModel {
  final int? id;
  final Duration fastingPeriod;
  final Duration fastingRestPeriod;
  final bool isCustom;

  FastingRoutineModel({
    this.id,
    required this.fastingPeriod,
    required this.fastingRestPeriod,
    required this.isCustom,
  });

  factory FastingRoutineModel.fromMap(Map<String, dynamic> map) {
    return FastingRoutineModel(
      id: map['id'] as int?,
      fastingPeriod: Duration(milliseconds: map['fasting_period_ms'] as int),
      fastingRestPeriod: Duration(
        milliseconds: map['fasting_rest_period_ms'] as int,
      ),
      isCustom: map['is_custom'] == 1,
    );
  }

  String toJson() {
    return json.encode(<String, dynamic>{
      'id': id,
      'fasting_period': fastingPeriod.inMilliseconds,
      'fasting_rest_period': fastingPeriod.inMilliseconds,
      'is_custom': isCustom,
    });
  }
}
