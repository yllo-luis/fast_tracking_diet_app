import 'dart:convert';

/// Represents a fasting routine configuration, defining the duration of fasting and rest periods.
class FastingRoutineModel {
  /// The unique identifier for the routine, typically assigned by the database.
  final int? id;

  /// The duration of the fasting phase.
  final Duration fastingPeriod;

  /// The duration of the rest (or eating) phase.
  final Duration fastingRestPeriod;

  /// Indicates whether this routine is a custom user-defined one or a predefined preset.
  final bool isCustom;


  /// Creates a new [FastingRoutineModel] instance.
  FastingRoutineModel({
    this.id,
    required this.fastingPeriod,
    required this.fastingRestPeriod,
    required this.isCustom,
  });

  /// Creates a [FastingRoutineModel] from a [Map].
  ///
  /// Expected keys:
  /// - `id`: [int] (optional)
  /// - `fasting_period_ms`: [int] (milliseconds)
  /// - `fasting_rest_period_ms`: [int] (milliseconds)
  /// - `is_custom`: [int] (1 for true, 0 for false)
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

  /// Converts the [FastingRoutineModel] into a JSON string representation.
  String toJson() {
    return json.encode(<String, dynamic>{
      'id': id,
      'fasting_period': fastingPeriod.inMilliseconds,
      'fasting_rest_period': fastingRestPeriod.inMilliseconds,
      'is_custom': isCustom,
    });
  }
}
