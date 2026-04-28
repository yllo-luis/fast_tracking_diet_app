import 'dart:convert';

/// A model representing a user's profile and settings stored locally.
///
/// This class holds basic user information such as their [userName] and
/// daily [kcalTarget], which are used throughout the application to
/// personalize the experience and track progress.
class LocalUserModel {
  LocalUserModel({
    this.id,
    required this.userName,
    required this.kcalTarget,
  });

  /// Unique identifier for the user in the local database.
  int? id;

  /// The name of the user.
  String userName;

  /// The daily calorie intake target for the user.
  int kcalTarget;

  /// Creates a [LocalUserModel] from a [Map].
  ///
  /// This is typically used when retrieving user data from a local database.
  /// Note: [kcalTarget] is expected to be a [String] in the map and will be parsed to an [int].
  factory LocalUserModel.fromMap(Map<String, dynamic> map) {
    return LocalUserModel(
      id: map['user_id'] as int?,
      userName: map['username'] as String,
      kcalTarget: int.parse(map['kcal_target']),
    );
  }

  /// Converts the [LocalUserModel] into a JSON string.
  ///
  /// The resulting JSON includes the [userName] and [kcalTarget].
  /// Note: The [id] is currently excluded from the JSON output.
  String toJson() {
    return jsonEncode(<String, dynamic>{
      'userName': userName,
      'kcal_target': kcalTarget,
    });
  }
}
