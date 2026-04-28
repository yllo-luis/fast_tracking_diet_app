// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get splashPageBackgroundPermissionDeniedTitle =>
      'You must enable the permission to run the app in the background to ensure that the app functions properly.';

  @override
  String get splashPageEnableBackgroundPermissionButtonTitle =>
      'Enable permission';

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
  String get errorTitle => 'An error has occurred!';

  @override
  String get errorSubTitle =>
      'An error has occurred! Please check your internet connection.';

  @override
  String get errorSubTitle2 => 'Ocorreu um erro! Tente novamente mais tarde.';

  @override
  String get errorValueTitle => 'Please enter a valid value.';

  @override
  String get loginErrorSubtitle => 'Please verify your password and email.';

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
  String get registerKcalFieldHintText => 'Enter your calorie goal here.';

  @override
  String get registerPasswordStrengthWeak => 'Weak';

  @override
  String get registerPasswordStrengthMedium => 'Medium';

  @override
  String get registerPasswordStrengthStrong => 'Strong';

  @override
  String get yesTitle => 'Yes';

  @override
  String get noTitle => 'No';

  @override
  String get cancelTitle => 'Cancel';

  @override
  String get saveTitle => 'Update';

  @override
  String get homeBottomNavigationItemFasting => 'Fasting';

  @override
  String get homeBottomNavigationItemCalculator => 'Calculator';

  @override
  String get homeBottomNavigationItemDiary => 'Diary';

  @override
  String get homeBottomNavigationItemProfile => 'Profile';

  @override
  String get homeFastingLayoutNotFasting => 'Not fasting';

  @override
  String get homeFastingLayoutTimeSinceLastFasting =>
      'Time since the last fast';

  @override
  String get homeFastingLayoutStartFastingButton => 'Start fasting';

  @override
  String get homeFastingLayoutPauseFastingButton => 'Pause the fast';

  @override
  String get homeFastingLayoutResumeFastingButton => 'Resume fast';

  @override
  String get homeFastingLayoutCancelFastingButton => 'Break fast';

  @override
  String get homeFastingLayoutFastingDateStart => 'Start';

  @override
  String get homeFastingLayoutFastingDateEnd => 'End';

  @override
  String get homeFastingLayoutTipsTitle => 'Tips';

  @override
  String get homeFastingLayoutTimeRemainingTitle => 'Time remaining:';

  @override
  String get homeFastingLayoutTimeElapsedTitle =>
      'Time elapsed since the start: ';

  @override
  String get homeFastingCancelFastingBody =>
      'Are you sure you want to stop intermittent fasting?';

  @override
  String homeFastingShareButtonText(String programType) {
    return 'Check it out—I\'m using the Fast Tracking App with the $programType plan. Check out the app in the store!';
  }

  @override
  String get homeFastingLayoutTipStartSlowlyTitle => 'Start slowly';

  @override
  String get homeFastingLayoutTipStartSlowlyBody =>
      'Do not attempt long fasts right away. Start with shorter windows, such as the 12/12 protocol (12 hours of fasting and 12 of eating), and gradually increase as your body adapts.';

  @override
  String get homeFastingLayoutTipDrinkWaterTitle => 'Stay hydrated';

  @override
  String get homeFastingLayoutTipDrinkWaterBody =>
      'Hydration is essential. Drink plenty of water, tea, or black coffee during your fasting period to help manage hunger and keep your metabolism functioning well.';

  @override
  String get homeFastingLayoutFoodQualityTitle => 'Prioritize food quality';

  @override
  String get homeFastingLayoutFoodQualityBody =>
      'When it is time to eat, focus on nutrient-dense foods. Prioritize proteins, healthy fats, fiber, and vegetables to ensure you are nourishing your body and staying full for longer.';

  @override
  String get homeFastingLayoutListenBodyTitle => 'Listen to your body';

  @override
  String get homeFastingLayoutListenBody =>
      'Fasting should not cause extreme distress. If you feel dizzy, excessively weak, or unwell, break your fast. It is important to distinguish between psychological hunger and signals that your body truly needs energy.';

  @override
  String get homeFastingRoutineSelectTitle => 'Select a fasting program';

  @override
  String get homeFastingRoutineSelectCurrentPlan => 'Current plan';

  @override
  String get homeFastingRoutineSelectQuickPlan => 'Quick plans';

  @override
  String get homeFastingRoutineSelectCustomPlan => 'Custom plans';

  @override
  String get homeFastingRoutineSelectCustomPlanEmpty =>
      'Save a plan as a template to view here.';

  @override
  String get homeFastingRoutineCustomFastingTipSchedule =>
      'Choose your own schedule: Don’t try to stick to a fixed schedule if it doesn’t work for you. Start with a 14- or 16-hour fast and adjust your eating window to fit your day, not the other way around.';

  @override
  String get homeFastingRoutineCustomFastingTipWater =>
      'Stay well-hydrated: Whenever you feel hungry between meals, drink a glass of water, coffee, or unsweetened tea. This helps control the urge to eat without breaking your fast.';

  @override
  String get homeFastingRoutineCustomFastingTipBreakfast =>
      'Your first meal matters: When you eat, avoid bread, pasta, or sweets right away. Opt for eggs, meats, salads, or healthy fats (like avocado). This prevents post-lunch drowsiness and keeps your energy levels high.';

  @override
  String get homeFastingRoutineCustomFastingTipWork =>
      'Use fasting to work better: If you need to focus on a difficult task, take advantage of the fasting period. Many people feel more alert and focused without the heavy digestion weighing on their bodies.';

  @override
  String get homeFastingRoutineCustomFastingHintFastingTime => 'Fasting time';

  @override
  String get homeFastingRoutineCustomFastingHintRestTime => 'Rest period';

  @override
  String get homeFastingRoutineCustomCreateButton => 'Create a routine';

  @override
  String get homeFastingNotificationStartTitle => 'Fasting Started';

  @override
  String get homeFastingNotificationStartBody =>
      'Your fasting timer has started. Let\'s do this!';

  @override
  String get homeFastingNotificationPausedTitle => 'Fasting Paused';

  @override
  String get homeFastingNotificationPausedBody =>
      'Your fast is paused. You can resume it at any time.';

  @override
  String get homeFastingNotificationCancelledTitle => 'Fasting Cancelled';

  @override
  String get homeFastingNotificationCancelledBody =>
      'Fasting cancelled. Don\'t worry, you can start a new cycle whenever you\'re ready.';

  @override
  String get homeFastingNotificationCompletedTitle => 'Fast complete!';

  @override
  String get homeFastingNotificationCompletedBody =>
      'Well done on completing your fast! You\'re one step closer to your goals. Keep it up!';

  @override
  String get homeFastingDenyChangeOnPageTitle => 'Let\'s focus on fasting!';

  @override
  String get homeFastingDenyChangeOnPageBody =>
      'Focus on your fast! Access to the rest of the app will be unlocked upon completion.';

  @override
  String get homeFastingHistoryNoHistoryText1 =>
      'The first step toward a new routine begins with your very first fast. Intermittent fasting isn’t just about the time you spend without eating; it’s about giving your body the space it needs to recover, renew its energy, and bring more clarity to your daily life.';

  @override
  String get homeFastingHistoryNoHistoryText2 =>
      'Why not give it a try today? Choose a window that fits your lifestyle and experience for yourself how easy it is to get started.';

  @override
  String get homeFastingHistoryStartFastingButton => 'Start my first fast';

  @override
  String get homeFastingHistoryGraphTitle => 'Fasting History';

  @override
  String homeFastingHistoryDataTitle(String fastingTime) {
    return 'Fasting time: $fastingTime hours';
  }

  @override
  String get homeFastingKcalRegistryMessage =>
      'Your day begins now. Log what you\'ve consumed and take control of your nutrition.';

  @override
  String get homeFastingKcalRegistryButton => 'Track meals';

  @override
  String get homeFastingKcalRegistryNoRegistryMessage =>
      'Logging is the first step toward balance. Let us know what you\'ve had to eat today!';

  @override
  String get kcalTypeBreakfastLabel => 'Breakfast';

  @override
  String get kcalTypeLunchLabel => 'Lunch';

  @override
  String get kcalTypeDinnerLabel => 'Dinner';

  @override
  String get kcalTypeOtherLabel => 'Other';

  @override
  String get homeFastingRegistryTip01 =>
      'Don\'t forget to log cooking oils, dressings, and sauces. They add up quickly.';

  @override
  String get homeFastingRegistryTip02 =>
      'If you\'re in a rush, take a picture of your plate to log the details later.';

  @override
  String get homeFastingRegistryTip03 =>
      'Don\'t aim for absolute perfection; focus on the consistency of your weekly average.';

  @override
  String get homeFastingRegistryName => 'Meal name';

  @override
  String get homeFastingRegistryQuantity => 'Meal calorie count';

  @override
  String get homeFastingRegistryDate => 'Meal date';

  @override
  String get homeFastingRegistryType => 'Meal type';

  @override
  String get homeFastingRegistryButton => 'Log meal';

  @override
  String get homeProfileTitle => 'Profile';

  @override
  String get homeProfileUsername => 'Username';

  @override
  String get homeProfileFastingsDoneSoFar => 'Fasts completed so far';

  @override
  String get homeProfileKcalMax => 'Calorie goal';

  @override
  String get homeProfileUpdateKcalMaxTitle => 'Update calorie goal';

  @override
  String get homeProfileUpdateNewKcalTitle => 'New goal (kcal)';

  @override
  String get homeFastingNoKcalDefinedWarning =>
      'Your calorie goal must be set to access this feature.';

  @override
  String get homeFastingNoKcalDefinedWarningButton => 'Set goal';
}
