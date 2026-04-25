import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

import '../../../app/l10n/app_localizations.dart';
import '../../../utils/enums/password_strength_custom_enum.dart';

class PasswordCheckerWidget extends StatelessWidget {
  const PasswordCheckerWidget({
    super.key,
    this.minimumStrengthRequired,
    required this.passwordController,
    required this.shouldHidePassword,
    required this.onShowPassword,
    this.hintText,
  });

  final PasswordStrengthCustomEnum? minimumStrengthRequired;
  final TextEditingController passwordController;
  final bool shouldHidePassword;
  final Function onShowPassword;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return PasswordStrengthFormChecker(
      minimumStrengthRequired:
          minimumStrengthRequired ?? PasswordStrengthCustomEnum.medium,
      onChanged: (password, notifier) {
        notifier.value = PasswordStrengthCustomEnum.calculate(text: password);
      },
      errorMessage: AppLocalizations.of(context)!.loginInvalidPasswordText,
      emptyTextErrorMessage: AppLocalizations.of(context)!.loginInvalidPasswordText,
      onPasswordGenerated: (password, strengthNotifier) {
        strengthNotifier.value = PasswordStrengthCustomEnum.calculate(
          text: password,
        );
      },
      showGenerator: true,
      generateButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        elevation: WidgetStateProperty.all(0),
        side: WidgetStateProperty.all(BorderSide.none),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
      ),
      generateButtonChild: Text(
        AppLocalizations.of(context)!.registerButtonGeneratePasswordTitle,
      ),
      textFormFieldConfiguration: TextFormFieldConfiguration(
        obscureText: shouldHidePassword,
        controller: passwordController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              shouldHidePassword
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
            ),
            onPressed: () => onShowPassword(),
          ),
          hintText:
              hintText ??
              AppLocalizations.of(context)!.loginPasswordFieldHintText,
        ),
      ),
    );
  }
}
