import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

/// The default password strength length.
const int kDefaultStrengthLength = 12;

/// The default enum for the password strength.
enum PasswordStrengthCustomEnum implements PasswordStrengthItem {
  alreadyExposed,
  weak,
  medium,
  strong,
  secure;

  /// The color for every status.
  @override
  Color get statusColor => switch (this) {
    alreadyExposed => const Color.fromARGB(255, 158, 15, 5),
    weak => Colors.red,
    medium => Colors.orange,
    strong => Colors.green,
    secure => const Color(0xFF0B6C0E),
  };

  /// The percentual width of every status.
  @override
  double get widthPerc => switch (this) {
    alreadyExposed => 0.075,
    weak => 0.15,
    medium => 0.4,
    strong => 0.75,
    secure => 1.0,
  };

  /// The widget to show for every status under the bar.
  @override
  Widget get statusWidget => switch (this) {
    alreadyExposed => const SizedBox.shrink(),
    weak => const SizedBox.shrink(),
    medium => const SizedBox.shrink(),
    strong => const SizedBox.shrink(),
    secure => const SizedBox.shrink(),
  };

  /// Returns the [PasswordStrength] from the [text] value.
  static PasswordStrengthCustomEnum? calculate({required String text}) {
    if (text.isEmpty) {
      return null;
    }

    if (commonDictionary[text] == true) {
      return alreadyExposed;
    }

    if (text.length < kDefaultStrengthLength) {
      return weak;
    }

    var counter = 0;
    if (text.contains(RegExp(r'[a-z]'))) counter++;
    if (text.contains(RegExp(r'[A-Z]'))) counter++;
    if (text.contains(RegExp(r'[0-9]'))) counter++;
    if (text.contains(RegExp(r'[!@#\$%&*()?£\-_=]'))) counter++;

    return switch (counter) {
      1 => weak,
      2 => medium,
      3 => strong,
      4 => secure,
      _ => weak,
    };
  }

  /// Instructions for the password strength.
  static String get instructions {
    return 'Enter a password that contains:\n\n'
        '• At least $kDefaultStrengthLength characters\n'
        '• At least 1 lowercase letter\n'
        '• At least 1 uppercase letter\n'
        '• At least 1 digit\n'
        '• At least 1 special character';
  }
}
