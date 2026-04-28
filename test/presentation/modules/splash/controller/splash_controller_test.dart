import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/app/services/notification/notification_service.dart';
import 'package:fast_tracking_diet_app/app/services/shared_preferences/shared_preferences_service.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Run `flutter pub run build_runner build` to generate the mocks.
import 'splash_controller_test.mocks.dart';

@GenerateMocks([
  FirebaseAuthService,
  NotificationService,
  SharedPreferencesService,
  IModularNavigator,
  User,
])
void main() {
  late SplashController splashController;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late MockNotificationService mockNotificationService;
  late MockSharedPreferencesService mockSharedPreferencesService;
  late MockIModularNavigator mockNavigator;

  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockNotificationService = MockNotificationService();
    mockSharedPreferencesService = MockSharedPreferencesService();
    mockNavigator = MockIModularNavigator();

    // Mocking Modular.to navigation
    Modular.navigatorDelegate = mockNavigator;

    splashController = SplashController(
      firebaseAuthService: mockFirebaseAuthService,
      notificationService: mockNotificationService,
      sharedPreferencesService: mockSharedPreferencesService,
    );
  });

  group('SplashController Unit Tests', () {
    test('initSharedPreferences should call getSharedPreferencesInstance', () async {
      when(mockSharedPreferencesService.getSharedPreferencesInstance())
          .thenAnswer((_) async => Future.value());

      await splashController.initSharedPreferences();

      verify(mockSharedPreferencesService.getSharedPreferencesInstance()).called(1);
    });

    test('initNotificationService should call notificationService.init', () async {
      when(mockNotificationService.init()).thenAnswer((_) async => Future.value());

      await splashController.initNotificationService();

      verify(mockNotificationService.init()).called(1);
    });

    group('checkIfUserIsLoggedIn', () {
      test('should not navigate if already on permission denied view', () async {
        when(mockNavigator.path).thenReturn('/background_permission_denied_view');

        await splashController.checkIfUserIsLoggedIn();

        verifyNever(mockNavigator.pushReplacementNamed(any));
      });
    });
  });
}