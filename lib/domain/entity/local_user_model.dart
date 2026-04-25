import 'dart:convert';

class LocalUserModel {
  LocalUserModel({
    required this.userName,
    required this.birthdate,
  });

  String userName;
  DateTime birthdate;

  String toJson() {
    return jsonEncode(<String, dynamic>{
      'userName': userName,
      'birthdate': birthdate.toIso8601String(),
    });
  }
}
