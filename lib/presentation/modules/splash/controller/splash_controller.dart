import 'package:fast_tracking_diet_app/app/auth/firebase_auth_service.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  SplashController({required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;
  
  Future<void> init() async {
    await checkIfBackgroundServiceIsEnabled();
    await checkIfUserIsLoggedIn();
  }

  /// Checking if user is logged in. If [firebaseAuthService]
  /// returns false then the user is going to be redirected to the [LoginModule] part of the application.
  Future<void> checkIfUserIsLoggedIn({bool backgroundRecheck = false}) async {
    await Future.delayed(const Duration(seconds: 2));

    if (Modular.to.path != "/background_permission_denied_view") {
      if (firebaseAuthService.currentUser == null) {
        Modular.to.pushReplacementNamed('/login');
      } else {
        Modular.to.pushReplacementNamed('/home');
      }
    }
  }

  Future<void> checkIfBackgroundServiceIsEnabled() async {
    bool hasBackgroundPermission = await FlutterBackground.hasPermissions;

    final androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "Fasting Tracking Diet App",
      notificationText:
      "Background notification for keeping the example app running in the background",
      notificationImportance: AndroidNotificationImportance.normal,
      notificationIcon: AndroidResource(
        name: 'background_icon',
        defType: 'drawable',
      ),
    );

    if (hasBackgroundPermission == false) {
      bool success = await FlutterBackground.initialize(
        androidConfig: androidConfig,
      );

      if (success == false && Modular.to.path != "/background_permission_denied_view") {
        Modular.to.pushReplacementNamed('background_permission_denied_view');
      }
    }

    await FlutterBackground.initialize(
      androidConfig: androidConfig,
    );
  }
}
