import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/app/services/notification/notification_service.dart';
import 'package:fast_tracking_diet_app/app/services/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_modular/flutter_modular.dart';


/// Controller for the Splash screen that handles app initialization.
///
/// This controller manages the startup sequence, including checking background permissions,
/// initializing services (Notifications, Shared Preferences), and routing the user
/// based on their authentication status.
class SplashController {
  /// Creates a [SplashController] with the required services.
  SplashController({
    required this.firebaseAuthService,
    required this.notificationService,
    required this.sharedPreferencesService,
  });

  /// Service for handling Firebase authentication.
  final FirebaseAuthService firebaseAuthService;

  /// Service for managing local push notifications.
  final NotificationService notificationService;

  /// Service for persistent local storage.
  final SharedPreferencesService sharedPreferencesService;

  /// Orchestrates the initialization sequence of the application.
  ///
  /// It sequentially initializes the background service, notification service,
  /// shared preferences, and finally checks the user's login status to determine
  /// the next navigation destination.
  Future<void> init() async {
    await checkIfBackgroundServiceIsEnabled();
    await initNotificationService();
    await initSharedPreferences();
    await checkIfUserIsLoggedIn();
  }

  /// Navigates the user based on their login status.
  ///
  /// If [firebaseAuthService.currentUser] is null, the user is redirected to the login flow.
  /// Otherwise, they are sent to the home screen.
  ///
  /// [backgroundRecheck] indicates if this check is being triggered from a background state.
  Future<void> checkIfUserIsLoggedIn({bool backgroundRecheck = false}) async {
    if (Modular.to.path != "/background_permission_denied_view") {
      if (firebaseAuthService.currentUser == null) {
        Modular.to.pushReplacementNamed('/login');
      } else {
        Modular.to.pushReplacementNamed('/home');
      }
    }
  }

  /// Initializes the [SharedPreferencesService] by getting an instance.
  Future<void> initSharedPreferences() async =>
      sharedPreferencesService.getSharedPreferencesInstance();

  /// Initializes the [NotificationService].
  Future<void> initNotificationService() async {
    await notificationService.init();
  }

  /// Verifies if the app has permission to run in the background.
  ///
  /// If permissions are not granted, it attempts to initialize the [FlutterBackground]
  /// plugin with a specific [FlutterBackgroundAndroidConfig]. If initialization fails,
  /// it redirects the user to the background permission denial view.
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

      if (success == false &&
          Modular.to.path != "/background_permission_denied_view") {
        Modular.to.pushReplacementNamed('background_permission_denied_view');
      }
    }

    await FlutterBackground.initialize(androidConfig: androidConfig);
  }
}
