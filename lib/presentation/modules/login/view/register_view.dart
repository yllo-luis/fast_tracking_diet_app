import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/l10n/app_localizations.dart';
import '../../../presentation_utils/presentation_constants.dart';
import '../../../presentation_utils/widgets/password_checker_widget.dart';
import '../controller/login_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final LoginController controller = Modular.get<LoginController>();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  ValueNotifier<bool> shouldHidePassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 52.0,
            ),
            child: Column(
              spacing: 18,
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppLocalizations.of(context)!.registerTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  AppLocalizations.of(context)!.registerSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Lottie.asset(
                  'assets/register_lottie_asset.json',
                  repeat: false,
                ),
                Form(
                  key: formState,
                  child: Column(
                    spacing: 18,
                    children: [
                      TextFormField(
                        controller:
                            controller.getLoginStoreInst.userNameRegister,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(
                            context,
                          )!.loginEmailFieldHintText,
                        ),
                        validator: (value) {
                          if (value == null ||
                              EmailValidator.validate(value) == false) {
                            return AppLocalizations.of(
                              context,
                            )!.loginInvalidEmailText;
                          }

                          return null;
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: shouldHidePassword,
                        builder: (context, value, child) {
                          return PasswordCheckerWidget(
                            passwordController:
                                controller.getLoginStoreInst.passwordRegister,
                            shouldHidePassword: value,
                            onShowPassword: () =>
                                shouldHidePassword.value = !value,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: controller.getLoginStoreInst.isDoingRegister,
                  builder: (context, value, child) {
                    return Center(
                      child: AnimatedSwitcher(
                        duration: PresentationConstants.animationDuration,
                        child: value == false
                            ? FilledButton(
                                onPressed: () {
                                  if (formState.currentState?.validate() ==
                                      true) {
                                    controller.doRegister().catchError((_, _) {
                                      if (context.mounted) {
                                        showErrorSnackbar(context);
                                      }
                                    });
                                  }
                                },
                                child: Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.registerButtonTitle,
                                  style: GoogleFonts.inter(),
                                ),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppLocalizations.of(context)!.errorTitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            Text(
              AppLocalizations.of(context)!.errorSubTitle,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
