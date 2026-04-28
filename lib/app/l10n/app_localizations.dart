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

  /// No description provided for @errorSubTitle2.
  ///
  /// In en, this message translates to:
  /// **'Ocorreu um erro! Tente novamente mais tarde.'**
  String get errorSubTitle2;

  /// No description provided for @errorValueTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid value.'**
  String get errorValueTitle;

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

  /// No description provided for @registerKcalFieldHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your calorie goal here.'**
  String get registerKcalFieldHintText;

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

  /// No description provided for @yesTitle.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesTitle;

  /// No description provided for @noTitle.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noTitle;

  /// No description provided for @cancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelTitle;

  /// No description provided for @saveTitle.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get saveTitle;

  /// No description provided for @homeBottomNavigationItemFasting.
  ///
  /// In en, this message translates to:
  /// **'Fasting'**
  String get homeBottomNavigationItemFasting;

  /// No description provided for @homeBottomNavigationItemCalculator.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get homeBottomNavigationItemCalculator;

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
  /// **'Pause the fast'**
  String get homeFastingLayoutPauseFastingButton;

  /// No description provided for @homeFastingLayoutResumeFastingButton.
  ///
  /// In en, this message translates to:
  /// **'Resume fast'**
  String get homeFastingLayoutResumeFastingButton;

  /// No description provided for @homeFastingLayoutCancelFastingButton.
  ///
  /// In en, this message translates to:
  /// **'Break fast'**
  String get homeFastingLayoutCancelFastingButton;

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

  /// No description provided for @homeFastingLayoutTimeRemainingTitle.
  ///
  /// In en, this message translates to:
  /// **'Time remaining:'**
  String get homeFastingLayoutTimeRemainingTitle;

  /// No description provided for @homeFastingLayoutTimeElapsedTitle.
  ///
  /// In en, this message translates to:
  /// **'Time elapsed since the start: '**
  String get homeFastingLayoutTimeElapsedTitle;

  /// No description provided for @homeFastingCancelFastingBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to stop intermittent fasting?'**
  String get homeFastingCancelFastingBody;

  /// Texto para compartilhamento do progresso de jejum
  ///
  /// In en, this message translates to:
  /// **'Check it out—I\'m using the Fast Tracking App with the {programType} plan. Check out the app in the store!'**
  String homeFastingShareButtonText(String programType);

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

  /// No description provided for @homeFastingRoutineCustomFastingTipSchedule.
  ///
  /// In en, this message translates to:
  /// **'Choose your own schedule: Don’t try to stick to a fixed schedule if it doesn’t work for you. Start with a 14- or 16-hour fast and adjust your eating window to fit your day, not the other way around.'**
  String get homeFastingRoutineCustomFastingTipSchedule;

  /// No description provided for @homeFastingRoutineCustomFastingTipWater.
  ///
  /// In en, this message translates to:
  /// **'Stay well-hydrated: Whenever you feel hungry between meals, drink a glass of water, coffee, or unsweetened tea. This helps control the urge to eat without breaking your fast.'**
  String get homeFastingRoutineCustomFastingTipWater;

  /// No description provided for @homeFastingRoutineCustomFastingTipBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Your first meal matters: When you eat, avoid bread, pasta, or sweets right away. Opt for eggs, meats, salads, or healthy fats (like avocado). This prevents post-lunch drowsiness and keeps your energy levels high.'**
  String get homeFastingRoutineCustomFastingTipBreakfast;

  /// No description provided for @homeFastingRoutineCustomFastingTipWork.
  ///
  /// In en, this message translates to:
  /// **'Use fasting to work better: If you need to focus on a difficult task, take advantage of the fasting period. Many people feel more alert and focused without the heavy digestion weighing on their bodies.'**
  String get homeFastingRoutineCustomFastingTipWork;

  /// No description provided for @homeFastingRoutineCustomFastingHintFastingTime.
  ///
  /// In en, this message translates to:
  /// **'Fasting time'**
  String get homeFastingRoutineCustomFastingHintFastingTime;

  /// No description provided for @homeFastingRoutineCustomFastingHintRestTime.
  ///
  /// In en, this message translates to:
  /// **'Rest period'**
  String get homeFastingRoutineCustomFastingHintRestTime;

  /// No description provided for @homeFastingRoutineCustomCreateButton.
  ///
  /// In en, this message translates to:
  /// **'Create a routine'**
  String get homeFastingRoutineCustomCreateButton;

  /// No description provided for @homeFastingNotificationStartTitle.
  ///
  /// In en, this message translates to:
  /// **'Fasting Started'**
  String get homeFastingNotificationStartTitle;

  /// No description provided for @homeFastingNotificationStartBody.
  ///
  /// In en, this message translates to:
  /// **'Your fasting timer has started. Let\'s do this!'**
  String get homeFastingNotificationStartBody;

  /// No description provided for @homeFastingNotificationPausedTitle.
  ///
  /// In en, this message translates to:
  /// **'Fasting Paused'**
  String get homeFastingNotificationPausedTitle;

  /// No description provided for @homeFastingNotificationPausedBody.
  ///
  /// In en, this message translates to:
  /// **'Your fast is paused. You can resume it at any time.'**
  String get homeFastingNotificationPausedBody;

  /// No description provided for @homeFastingNotificationCancelledTitle.
  ///
  /// In en, this message translates to:
  /// **'Fasting Cancelled'**
  String get homeFastingNotificationCancelledTitle;

  /// No description provided for @homeFastingNotificationCancelledBody.
  ///
  /// In en, this message translates to:
  /// **'Fasting cancelled. Don\'t worry, you can start a new cycle whenever you\'re ready.'**
  String get homeFastingNotificationCancelledBody;

  /// No description provided for @homeFastingNotificationCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Fast complete!'**
  String get homeFastingNotificationCompletedTitle;

  /// No description provided for @homeFastingNotificationCompletedBody.
  ///
  /// In en, this message translates to:
  /// **'Well done on completing your fast! You\'re one step closer to your goals. Keep it up!'**
  String get homeFastingNotificationCompletedBody;

  /// No description provided for @homeFastingDenyChangeOnPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s focus on fasting!'**
  String get homeFastingDenyChangeOnPageTitle;

  /// No description provided for @homeFastingDenyChangeOnPageBody.
  ///
  /// In en, this message translates to:
  /// **'Focus on your fast! Access to the rest of the app will be unlocked upon completion.'**
  String get homeFastingDenyChangeOnPageBody;

  /// No description provided for @homeFastingHistoryNoHistoryText1.
  ///
  /// In en, this message translates to:
  /// **'The first step toward a new routine begins with your very first fast. Intermittent fasting isn’t just about the time you spend without eating; it’s about giving your body the space it needs to recover, renew its energy, and bring more clarity to your daily life.'**
  String get homeFastingHistoryNoHistoryText1;

  /// No description provided for @homeFastingHistoryNoHistoryText2.
  ///
  /// In en, this message translates to:
  /// **'Why not give it a try today? Choose a window that fits your lifestyle and experience for yourself how easy it is to get started.'**
  String get homeFastingHistoryNoHistoryText2;

  /// No description provided for @homeFastingHistoryStartFastingButton.
  ///
  /// In en, this message translates to:
  /// **'Start my first fast'**
  String get homeFastingHistoryStartFastingButton;

  /// No description provided for @homeFastingHistoryGraphTitle.
  ///
  /// In en, this message translates to:
  /// **'Fasting History'**
  String get homeFastingHistoryGraphTitle;

  /// Texto para compartilhamento do tempo de jejum feito
  ///
  /// In en, this message translates to:
  /// **'Fasting time: {fastingTime} hours'**
  String homeFastingHistoryDataTitle(String fastingTime);

  /// No description provided for @homeFastingKcalRegistryMessage.
  ///
  /// In en, this message translates to:
  /// **'Your day begins now. Log what you\'ve consumed and take control of your nutrition.'**
  String get homeFastingKcalRegistryMessage;

  /// No description provided for @homeFastingKcalRegistryButton.
  ///
  /// In en, this message translates to:
  /// **'Track meals'**
  String get homeFastingKcalRegistryButton;

  /// No description provided for @homeFastingKcalRegistryNoRegistryMessage.
  ///
  /// In en, this message translates to:
  /// **'Logging is the first step toward balance. Let us know what you\'ve had to eat today!'**
  String get homeFastingKcalRegistryNoRegistryMessage;

  /// No description provided for @kcalTypeBreakfastLabel.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get kcalTypeBreakfastLabel;

  /// No description provided for @kcalTypeLunchLabel.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get kcalTypeLunchLabel;

  /// No description provided for @kcalTypeDinnerLabel.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get kcalTypeDinnerLabel;

  /// No description provided for @kcalTypeOtherLabel.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get kcalTypeOtherLabel;

  /// No description provided for @homeFastingRegistryTip01.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to log cooking oils, dressings, and sauces. They add up quickly.'**
  String get homeFastingRegistryTip01;

  /// No description provided for @homeFastingRegistryTip02.
  ///
  /// In en, this message translates to:
  /// **'If you\'re in a rush, take a picture of your plate to log the details later.'**
  String get homeFastingRegistryTip02;

  /// No description provided for @homeFastingRegistryTip03.
  ///
  /// In en, this message translates to:
  /// **'Don\'t aim for absolute perfection; focus on the consistency of your weekly average.'**
  String get homeFastingRegistryTip03;

  /// No description provided for @homeFastingRegistryName.
  ///
  /// In en, this message translates to:
  /// **'Meal name'**
  String get homeFastingRegistryName;

  /// No description provided for @homeFastingRegistryQuantity.
  ///
  /// In en, this message translates to:
  /// **'Meal calorie count'**
  String get homeFastingRegistryQuantity;

  /// No description provided for @homeFastingRegistryDate.
  ///
  /// In en, this message translates to:
  /// **'Meal date'**
  String get homeFastingRegistryDate;

  /// No description provided for @homeFastingRegistryType.
  ///
  /// In en, this message translates to:
  /// **'Meal type'**
  String get homeFastingRegistryType;

  /// No description provided for @homeFastingRegistryButton.
  ///
  /// In en, this message translates to:
  /// **'Log meal'**
  String get homeFastingRegistryButton;

  /// No description provided for @homeProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get homeProfileTitle;

  /// No description provided for @homeProfileUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get homeProfileUsername;

  /// No description provided for @homeProfileFastingsDoneSoFar.
  ///
  /// In en, this message translates to:
  /// **'Fasts completed so far'**
  String get homeProfileFastingsDoneSoFar;

  /// No description provided for @homeProfileKcalMax.
  ///
  /// In en, this message translates to:
  /// **'Calorie goal'**
  String get homeProfileKcalMax;

  /// No description provided for @homeProfileUpdateKcalMaxTitle.
  ///
  /// In en, this message translates to:
  /// **'Update calorie goal'**
  String get homeProfileUpdateKcalMaxTitle;

  /// No description provided for @homeProfileUpdateNewKcalTitle.
  ///
  /// In en, this message translates to:
  /// **'New goal (kcal)'**
  String get homeProfileUpdateNewKcalTitle;

  /// No description provided for @homeFastingNoKcalDefinedWarning.
  ///
  /// In en, this message translates to:
  /// **'Your calorie goal must be set to access this feature.'**
  String get homeFastingNoKcalDefinedWarning;

  /// No description provided for @homeFastingNoKcalDefinedWarningButton.
  ///
  /// In en, this message translates to:
  /// **'Set goal'**
  String get homeFastingNoKcalDefinedWarningButton;
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
