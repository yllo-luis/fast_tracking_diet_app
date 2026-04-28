import 'dart:convert';

/// A model representing a caloric routine entry (e.g., meal).
///
/// This class is used to store and manage calorie-related data within the application,
/// typically persisted in a local database.
class LocalKcalRoutineModel {
  /// Unique identifier for the routine record.
  int? id;

  /// The name of the calorie entry.
  String? kcalName;

  /// A description of the routine entry.
  String? kcalDescription;

  /// The quantity of calories (intake or burned).
  int? kcalQuantity;

  /// The type of calorie routine (e.g., food, exercise).
  String? kcalType;

  /// The date when the calorie routine was recorded.
  DateTime? kcalDate;

  /// The ID of the user this record belongs to.
  int? userId;

  /// Creates a [LocalKcalRoutineModel] instance.
  LocalKcalRoutineModel({
    this.id,
     this.kcalName,
     this.kcalDescription,
     this.kcalQuantity,
     this.kcalType,
     this.kcalDate,
     this.userId,
  });

  /// Creates a [LocalKcalRoutineModel] from a [Map].
  ///
  /// This is typically used when retrieving data from a local database.
  factory LocalKcalRoutineModel.fromMap({required Map<String, dynamic> map}) {
    return LocalKcalRoutineModel(
      id: map['id'] as int?,
      kcalName: map['kcal_name'] as String?,
      kcalDescription: map['kcal_description'] as String?,
      kcalQuantity: map['kcal_quantity'] as int?,
      kcalType: map['kcal_type'] as String?,
      kcalDate: DateTime.tryParse(map['kcal_date'] ?? '') ,
      userId: map['user_id'] as int?,
    );
  }

  /// Converts the [LocalKcalRoutineModel] into a JSON string.
  ///
  /// Note: [kcalDate] is currently not included in the JSON output.
  String toJson() {
    return json.encode(<String, dynamic>{
      'id': id,
      'kcal_name': kcalName,
      'kcal_description': kcalDescription,
      'kcal_quantity': kcalQuantity,
      'kcal_type': kcalType,
      'user_id': userId
    });
  }
}
