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
  String get homeBottomNavigationItemFasting => 'Fasting';

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
}
