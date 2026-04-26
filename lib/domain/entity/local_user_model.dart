import 'dart:convert';

class LocalUserModel {
  LocalUserModel({
    this.id,
    required this.userName,
    required this.birthdate,
  });

  int? id;
  String userName;
  DateTime birthdate;

  factory LocalUserModel.fromMap(Map<String, dynamic> map) {
    return LocalUserModel(
      id: map['user_id'] as int?,
      userName: map['username'] as String,
      birthdate: DateTime.parse(map['birthdate'] as String),
    );
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      'userName': userName,
      'birthdate': birthdate.toIso8601String(),
    });
  }
}
