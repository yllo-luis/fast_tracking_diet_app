import 'package:email_validator/email_validator.dart';
import 'package:fast_tracking_diet_app/app/l10n/app_localizations.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../presentation_utils/presentation_constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Modular.get<LoginController>();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 18,
              children: [
                Text(
                  AppLocalizations.of(context)!.loginTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  AppLocalizations.of(context)!.loginSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Lottie.asset('assets/login_lottie_asset.json', repeat: false),
                Form(
                  key: formState,
                  child: Column(
                    spacing: 18,
                    children: [
                      TextFormField(
                        controller: controller.getLoginStoreInst.userName,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(
                            context,
                          )!.loginEmailFieldHintText,
                        ),
                        validator: (value) {
                          if (value == null || EmailValidator.validate(value) == false) {
                            return AppLocalizations.of(
                              context,
                            )!.loginInvalidEmailText;
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        controller: controller.getLoginStoreInst.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(
                            context,
                          )!.loginPasswordFieldHintText,
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true ||
                              (value?.length ?? 0) < 4) {
                            return AppLocalizations.of(
                              context,
                            )!.loginInvalidPasswordText;
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: controller.getLoginStoreInst.isDoingLogin,
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      duration: PresentationConstants.animationDuration,
                      child: Center(
                        child: FilledButton(
                          onPressed: () {
                            if (formState.currentState?.validate() == true) {
                              controller.doLogin();
                            }
                          },
                          child: Text('Login', style: GoogleFonts.inter()),
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: TextButton(
                    onPressed: () => Modular.to.pushNamed('register'),
                    child: Text(
                      AppLocalizations.of(context)!.loginRegisterTitle,
                      style: GoogleFonts.inter(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
