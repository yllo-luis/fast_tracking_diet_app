import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @splashPageBackgroundPermissionDeniedTitle.
  ///
  /// In en, this message translates to:
  /// **'You must enable the permission to run the app in the background to ensure that the app functions properly.'**
  String get splashPageBackgroundPermissionDeniedTitle;

  /// No description provided for @splashPageEnableBackgroundPermissionButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable permission'**
  String get splashPageEnableBackgroundPermissionButtonTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginTitle;

  /// No description provided for @loginSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to take advantage of all the features of Fast Tracking!'**
  String get loginSubTitle;

  /// No description provided for @loginEmailFieldHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address here'**
  String get loginEmailFieldHintText;

  /// No description provided for @loginPasswordFieldHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your password here'**
  String get loginPasswordFieldHintText;

  /// No description provided for @loginInvalidEmailText.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get loginInvalidEmailText;

  /// No description provided for @loginInvalidPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid password'**
  String get loginInvalidPasswordText;

  /// No description provided for @loginRegisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up here!'**
  String get loginRegisterTitle;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred!'**
  String get errorTitle;

  /// No description provided for @errorSubTitle.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred! Please check your internet connection.'**
  String get errorSubTitle;

  /// No description provided for @loginErrorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please verify your password and email.'**
  String get loginErrorSubtitle;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Start your health journey today'**
  String get registerTitle;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up to achieve your health goals with the support you need.'**
  String get registerSubtitle;

  /// No description provided for @registerButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get registerButtonTitle;

  /// No description provided for @registerButtonGeneratePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Generate Password'**
  String get registerButtonGeneratePasswordTitle;

  /// No description provided for @registerPasswordStrengthWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get registerPasswordStrengthWeak;

  /// No description provided for @registerPasswordStrengthMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get registerPasswordStrengthMedium;

  /// No description provided for @registerPasswordStrengthStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get registerPasswordStrengthStrong;

  /// No description provided for @homeBottomNavigationItemFasting.
  ///
  /// In en, this message translates to:
  /// **'Fasting'**
  String get homeBottomNavigationItemFasting;

  /// No description provided for @homeBottomNavigationItemDiary.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get homeBottomNavigationItemDiary;

  /// No description provided for @homeBottomNavigationItemProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get homeBottomNavigationItemProfile;

  /// No description provided for @homeFastingLayoutNotFasting.
  ///
  /// In en, this message translates to:
  /// **'Not fasting'**
  String get homeFastingLayoutNotFasting;

  /// No description provided for @homeFastingLayoutTimeSinceLastFasting.
  ///
  /// In en, this message translates to:
  /// **'Time since the last fast'**
  String get homeFastingLayoutTimeSinceLastFasting;

  /// No description provided for @homeFastingLayoutStartFastingButton.
  ///
  /// In en, this message translates to:
  /// **'Start fasting'**
  String get homeFastingLayoutStartFastingButton;

  /// No description provided for @homeFastingLayoutPauseFastingButton.
  ///
  /// In en, this message translates to:
  /// **'Break the fast'**
  String get homeFastingLayoutPauseFastingButton;

  /// No description provided for @homeFastingLayoutFastingDateStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get homeFastingLayoutFastingDateStart;

  /// No description provided for @homeFastingLayoutFastingDateEnd.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get homeFastingLayoutFastingDateEnd;

  /// No description provided for @homeFastingLayoutTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get homeFastingLayoutTipsTitle;

  /// No description provided for @homeFastingLayoutTipStartSlowlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Start slowly'**
  String get homeFastingLayoutTipStartSlowlyTitle;

  /// No description provided for @homeFastingLayoutTipStartSlowlyBody.
  ///
  /// In en, this message translates to:
  /// **'Do not attempt long fasts right away. Start with shorter windows, such as the 12/12 protocol (12 hours of fasting and 12 of eating), and gradually increase as your body adapts.'**
  String get homeFastingLayoutTipStartSlowlyBody;

  /// No description provided for @homeFastingLayoutTipDrinkWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated'**
  String get homeFastingLayoutTipDrinkWaterTitle;

  /// No description provided for @homeFastingLayoutTipDrinkWaterBody.
  ///
  /// In en, this message translates to:
  /// **'Hydration is essential. Drink plenty of water, tea, or black coffee during your fasting period to help manage hunger and keep your metabolism functioning well.'**
  String get homeFastingLayoutTipDrinkWaterBody;

  /// No description provided for @homeFastingLayoutFoodQualityTitle.
  ///
  /// In en, this message translates to:
  /// **'Prioritize food quality'**
  String get homeFastingLayoutFoodQualityTitle;

  /// No description provided for @homeFastingLayoutFoodQualityBody.
  ///
  /// In en, this message translates to:
  /// **'When it is time to eat, focus on nutrient-dense foods. Prioritize proteins, healthy fats, fiber, and vegetables to ensure you are nourishing your body and staying full for longer.'**
  String get homeFastingLayoutFoodQualityBody;

  /// No description provided for @homeFastingLayoutListenBodyTitle.
  ///
  /// In en, this message translates to:
  /// **'Listen to your body'**
  String get homeFastingLayoutListenBodyTitle;

  /// No description provided for @homeFastingLayoutListenBody.
  ///
  /// In en, this message translates to:
  /// **'Fasting should not cause extreme distress. If you feel dizzy, excessively weak, or unwell, break your fast. It is important to distinguish between psychological hunger and signals that your body truly needs energy.'**
  String get homeFastingLayoutListenBody;

  /// No description provided for @homeFastingRoutineSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Select a fasting program'**
  String get homeFastingRoutineSelectTitle;

  /// No description provided for @homeFastingRoutineSelectCurrentPlan.
  ///
  /// In en, this message translates to:
  /// **'Current plan'**
  String get homeFastingRoutineSelectCurrentPlan;

  /// No description provided for @homeFastingRoutineSelectQuickPlan.
  ///
  /// In en, this message translates to:
  /// **'Quick plans'**
  String get homeFastingRoutineSelectQuickPlan;

  /// No description provided for @homeFastingRoutineSelectCustomPlan.
  ///
  /// In en, this message translates to:
  /// **'Custom plans'**
  String get homeFastingRoutineSelectCustomPlan;

  /// No description provided for @homeFastingRoutineSelectCustomPlanEmpty.
  ///
  /// In en, this message translates to:
  /// **'Save a plan as a template to view here.'**
  String get homeFastingRoutineSelectCustomPlanEmpty;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
