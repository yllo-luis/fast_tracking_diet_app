// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Sign in';

  @override
  String get loginSubTitle =>
      'Log in to take advantage of all the features of Fast Tracking!';

  @override
  String get loginEmailFieldHintText => 'Enter your email address here';

  @override
  String get loginPasswordFieldHintText => 'Enter your password here';

  @override
  String get loginInvalidEmailText => 'Please enter a valid email address';

  @override
  String get loginInvalidPasswordText => 'Please enter a valid password';

  @override
  String get loginRegisterTitle => 'Don\'t have an account? Sign up here!';

  @override
  String get registerTitle => 'Start your health journey today';

  @override
  String get registerSubtitle =>
      'Sign up to achieve your health goals with the support you need.';

  @override
  String get registerButtonTitle => 'Sign up';

  @override
  String get registerButtonGeneratePasswordTitle => 'Generate Password';

  @override
  String get registerPasswordStrengthWeak => 'Weak';

  @override
  String get registerPasswordStrengthMedium => 'Medium';

  @override
  String get registerPasswordStrengthStrong => 'Strong';
}
