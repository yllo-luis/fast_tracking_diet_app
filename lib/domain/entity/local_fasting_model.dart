import 'dart:convert';

/// A model representing a local fasting session.
///
/// This class is used to store and manage fasting data within the application,
/// typically persisted in a local database.
class LocalFastingModel {
  /// Unique identifier for the fasting record.
  int? id;

  /// The ID of the user this fasting record belongs to.
  int userId;

  /// The date and time when the fasting session started.
  DateTime fastingDateStart;

  /// The date and time when the fasting session ended, if completed.
  DateTime? fastingDateEnd;

  /// The total planned duration of the fasting session.
  Duration? fastingTotalTime;

  /// The actual duration elapsed since the start of the fasting session.
  Duration? fastingElapsedTime;

  /// Creates a [LocalFastingModel] instance.
  LocalFastingModel({
    this.id,
    required this.userId,
    required this.fastingDateStart,
    this.fastingDateEnd,
    this.fastingTotalTime,
    this.fastingElapsedTime,
  });

  /// Creates a [LocalFastingModel] from a [Map].
  ///
  /// This is typically used when retrieving data from a local database.
  factory LocalFastingModel.fromMap(Map<String, dynamic> map) {
    return LocalFastingModel(
      id: map['id'] as int?,
      userId: map['user_id'] as int,
      fastingDateStart: DateTime.parse(map['date_start'] as String),
      fastingDateEnd: map['date_end'] != null ? DateTime.parse(map['date_end'] as String) : null,
      fastingTotalTime: map['fasting_total_time'] != null ? Duration(milliseconds: int.parse(map['fasting_total_time'])) : null,
      fastingElapsedTime: map['fasting_elapsed_time'] != null ? Duration(milliseconds: int.parse(map['fasting_elapsed_time'])) : null,
    );
  }


  /// Converts the [LocalFastingModel] into a JSON string.
  ///
  /// The resulting JSON includes the user ID, start/end dates in ISO 8601 format,
  /// and durations in milliseconds.
  String toJson() {
    return jsonEncode(<String,dynamic>{
      'user_id': userId,
      'fasting_date_start': fastingDateStart.toIso8601String(),
      'fasting_date_end': fastingDateEnd?.toIso8601String(),
      'fasting_total_time': fastingTotalTime?.inMilliseconds,
      'fasting_elapsed_time': fastingElapsedTime?.inMilliseconds,
    });
  }
}
