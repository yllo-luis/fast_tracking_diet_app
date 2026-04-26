import 'package:fast_tracking_diet_app/app/l10n/app_localizations.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class BackgroundPermissionDeniedView extends StatefulWidget {
  const BackgroundPermissionDeniedView({super.key});

  @override
  State<BackgroundPermissionDeniedView> createState() =>
      _BackgroundPermissionDeniedViewState();
}

class _BackgroundPermissionDeniedViewState
    extends State<BackgroundPermissionDeniedView> {
  final controller = Modular.get<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              crossAxisAlignment: .center,
              children: [
                Lottie.asset(
                  'assets/allow_permission_lottie_asset.json',
                  repeat: false,
                ),
                Text(
                  AppLocalizations.of(
                    context,
                  )!.splashPageBackgroundPermissionDeniedTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                FilledButton(
                  onPressed: () async {
                    await controller.checkIfBackgroundServiceIsEnabled();

                    bool hasBackgroundPermission =
                        await FlutterBackground.hasPermissions;

                    if (hasBackgroundPermission) {
                      if (controller.firebaseAuthService.currentUser == null) {
                        Modular.to.pushReplacementNamed('/login');
                      } else {
                        Modular.to.pushReplacementNamed('/home');
                      }
                    }
                  },
                  child: Text(
                    AppLocalizations.of(
                      context,
                    )!.splashPageEnableBackgroundPermissionButtonTitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
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
